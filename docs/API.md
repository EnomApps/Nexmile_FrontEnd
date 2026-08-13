 # Nexmile — APIs the app calls

Every network call the customer app makes, and the screen that makes it.

**Base URL** `https://api.nexmile.in/api`
Overridable at build time without touching source:

```bash
flutter run --dart-define=NEXMILE_API_BASE_URL=http://10.0.2.2:8000/api
```

Defined in [app_config.dart](../lib/core/config/app_config.dart). `10.0.2.2` is how the Android
emulator reaches the host machine; on a physical device use the machine's LAN address.

**Every request carries** `Accept: application/json` — without it the API answers HTML on an error
and the decoder gets a login page instead of a payload. Requests with a body add
`Content-Type: application/json`, and authenticated ones add `Authorization: Bearer <token>`.
All of this is centralised in [api_client.dart](../lib/core/network/api_client.dart).

**Totals: 28 endpoints**, 27 of them in active use — 6 auth and profile (one unused, noted below),
6 address, 4 restaurants, 6 cart, 6 checkout and orders.

---

## 1. Authentication

Customer auth is OTP only. There is no registration, password or password-reset endpoint —
the account is created by the server on the first successful code verification.

| Method | Path | Called from | Notes |
|---|---|---|---|
| `POST` | `/v1/auth/otp/request` | [login_screen.dart](../lib/features/auth/presentation/login_screen.dart) | Body carries **either** `email` **or** `phone`, never both. Returns `resend_after` for the cooldown, and `debug_code` outside production. |
| `POST` | `/v1/auth/otp/verify` | [otp_verification_screen.dart](../lib/features/auth/presentation/otp_verification_screen.dart) | Same identifier plus `code` and `device_name`. Returns the token pair and the user. |
| `POST` | `/v1/auth/refresh` | [api_client.dart](../lib/core/network/api_client.dart) | Fired automatically on a 401. Concurrent 401s share one refresh, and one failure drops the session rather than looping. |
| `POST` | `/v1/auth/logout` | [profile_screen.dart](../lib/features/profile/profile_screen.dart) | The local session is cleared whether or not this succeeds — a signed-out customer must not stay signed in because the network was down. |
| `GET` | `/v1/profile` | [profile_screen.dart](../lib/features/profile/profile_screen.dart) | Cached copy renders first, then this refreshes it. |
| `GET` | `/v1/auth/me` | — | **Built but not called by any screen.** `/v1/profile` returns the same customer with more fields, so the profile screen uses that instead. Kept because the refresh path may want a cheap identity check. |

### Rate limits worth knowing
Codes are capped at 5 per hour per identifier, 60 seconds apart, and five wrong attempts burn a
code. A `429` surfaces as "Too many attempts"; a `403` means the account is suspended.

---

## 2. Address book

Delivery is limited to 1 km, so latitude and longitude are mandatory on every write and the
map-pin step is not skippable. All six endpoints are used.

| Method | Path | Called from | Notes |
|---|---|---|---|
| `GET` | `/v1/addresses` | [address_book_screen.dart](../lib/features/address/presentation/address_book_screen.dart) | Also read by the cart, so checkout has an address to offer. |
| `GET` | `/v1/addresses/{id}` | [address_controller.dart](../lib/features/address/state/address_controller.dart) | Single re-read after a delete promotes a new default. |
| `POST` | `/v1/addresses` | [address_form_screen.dart](../lib/features/address/presentation/address_form_screen.dart) | Coordinates are sent as numbers, not strings. Empty optional fields are dropped rather than sent blank. |
| `PATCH` | `/v1/addresses/{id}` | [address_form_screen.dart](../lib/features/address/presentation/address_form_screen.dart) | Same payload, used when correcting a saved address. |
| `DELETE` | `/v1/addresses/{id}` | [address_book_screen.dart](../lib/features/address/presentation/address_book_screen.dart) | When the deleted one was the default, the list is re-read — the server promotes another and the app must not be left with none. |
| `POST` | `/v1/addresses/{id}/default` | [address_book_screen.dart](../lib/features/address/presentation/address_book_screen.dart) | The default is what `GET /v1/restaurants` is anchored on. |

A `422` here comes back as `errors.<field>[0]` and is shown under the field that caused it,
verbatim — the server's wording is more accurate than anything the app could invent.

---

## 3. Restaurants

| Method | Path | Called from | Notes |
|---|---|---|---|
| `GET` | `/v1/restaurants` | [home_tab.dart](../lib/features/catalogue/presentation/home_tab.dart), [search_tab.dart](../lib/features/catalogue/presentation/search_tab.dart) | Query: `address_id` **or** `latitude`+`longitude`, plus optional `search` and `service_category`. The saved address wins — the API knows that pin better than a fresh GPS read, and it is the one checkout validates the 1 km radius against. |
| `GET` | `/v1/restaurants/deals` | [home_tab.dart](../lib/features/catalogue/presentation/home_tab.dart) | Food Rescue: surplus food, discounted, time-limited. A failure here is swallowed — deals are a nice-to-have and must not take the restaurant list down with them. |
| `GET` | `/v1/restaurants/{id}` | [restaurant_screen.dart](../lib/features/catalogue/presentation/restaurant_screen.dart) | `distance_metres` is absent when fetched directly, so no distance is shown rather than "0.0 km". |
| `GET` | `/v1/restaurants/{id}/menu` | [restaurant_screen.dart](../lib/features/catalogue/presentation/restaurant_screen.dart) | Returns `menu` (categories) **and** a separate `uncategorised` bucket. Both are rendered — a shop that never made categories would otherwise look empty. |

`is_open` gates ordering. When it is false, `within_operating_hours` says *why*: inside its hours
means "not taking orders", outside means "closed right now". Only one of those is worth waiting for.

---

## 4. Cart

Carts live on the server, one per restaurant, so an unfinished basket survives a reinstall and the
app never has to enforce a single-restaurant rule itself.

| Method | Path | Called from | Notes |
|---|---|---|---|
| `GET` | `/v1/restaurants/{id}/cart` | [cart_screen.dart](../lib/features/catalogue/presentation/cart_screen.dart), [restaurant_screen.dart](../lib/features/catalogue/presentation/restaurant_screen.dart) | A `404` means "no basket yet" and is not surfaced as an error. |
| `POST` | `/v1/restaurants/{id}/cart/items` | [customise_sheet.dart](../lib/features/catalogue/presentation/widgets/customise_sheet.dart) | `menu_item_id`, `quantity`, `option_ids`, `notes`. A dish with a required option group goes through the sheet first, so the 422 never happens. |
| `PATCH` | `/v1/restaurants/{id}/cart/items/{itemId}` | [cart_screen.dart](../lib/features/catalogue/presentation/cart_screen.dart) | The id is the **cart-item** id, not the menu-item id. Quantity `0` removes the line, so the minus button needs no special case. |
| `DELETE` | `/v1/restaurants/{id}/cart/items/{itemId}` | [cart_screen.dart](../lib/features/catalogue/presentation/cart_screen.dart) | Used to drop sold-out lines in one go. |
| `DELETE` | `/v1/restaurants/{id}/cart` | [cart_screen.dart](../lib/features/catalogue/presentation/cart_screen.dart) | "Clear cart". |
| `GET` | `/v1/carts` | [app_shell.dart](../lib/features/shell/app_shell.dart) | Every restaurant with an unfinished basket. Powers the "you left something at ___" bar above the navigation bar. |

Every mutation returns the whole cart, so app state is **replaced** from the response rather than
patched locally. Totals, the minimum, sold-out lines and `can_checkout` are all the server's answer;
recomputing any of them on the client would only drift.

---

## 5. Checkout and orders

| Method | Path | Called from | Notes |
|---|---|---|---|
| `POST` | `/v1/restaurants/{id}/cart/checkout` | [checkout_sheet.dart](../lib/features/catalogue/presentation/widgets/checkout_sheet.dart) | `fulfilment_type` (`delivery`/`pickup`), `payment_method` (`cod` — cash is the only method today), `address_id` on delivery only, optional `note`. |
| `GET` | `/v1/orders` | [orders_tab.dart](../lib/features/catalogue/presentation/orders_tab.dart) | Optional `active=1`. In-flight orders are lifted above finished ones. |
| `GET` | `/v1/orders/{id}` | [order_status_screen.dart](../lib/features/catalogue/presentation/order_status_screen.dart) | Full order: items, timeline, bill, pickup code. |
| `GET` | `/v1/orders/{id}/track` | [order_status_screen.dart](../lib/features/catalogue/presentation/order_status_screen.dart) | Small and cheap, polled every 8 seconds while in flight. Polling stops the moment the order finishes, so a delivered order does not keep a timer alive. Carries the rider's name, phone and live position. |
| `POST` | `/v1/orders/{id}/cancel` | [order_status_screen.dart](../lib/features/catalogue/presentation/order_status_screen.dart) | Body: `reason`. Only allowed while the order is `placed`; after that the API returns 422, so the button is hidden rather than left to fail. |
| `GET` | `/v1/orders/{id}/invoice` | [order_status_screen.dart](../lib/features/catalogue/presentation/order_status_screen.dart) | The one non-JSON call: a printable HTML tax invoice, opened in the browser rather than parsed. |

Everything is re-checked server-side at checkout — availability, opening hours, the 1 km radius,
the minimum — so a `422` is expected even when the cart looked fine a moment earlier. Whatever
comes back in `errors.<field>[0]` is shown to the customer word for word.

Order status is read from `status`, but the **label** shown on screen is the server's
`status_label`. The server knows about statuses this build may not; an unrecognised one decodes to
`unknown` and renders neutrally instead of crashing.

---

## Error handling

| HTTP | Meaning in this app |
|---|---|
| `401` | One automatic refresh and retry. If the refresh fails, the session is dropped and the customer is sent back to sign-in. |
| `403` | Account suspended. |
| `404` | On a cart, "no basket yet". Elsewhere, an error. |
| `422` | Validation. `errors.<field>[0]` is shown verbatim, under the field where one exists. |
| `429` | Rate limited — "too many attempts". |
| `5xx` / unparseable body | Generic "something went wrong". An HTML error page does not crash the decoder. |

Mapping lives in [api_exception.dart](../lib/core/network/api_exception.dart) and
[auth_failure.dart](../lib/features/auth/data/auth_failure.dart).

## Watching the calls live

Debug builds log every request and response through
[api_log.dart](../lib/core/network/api_log.dart), which sits inside `ApiClient` so all 28 endpoints
pass through it.

```
flutter run
```

Output appears in that console and, in Android Studio, under **Logcat** with the filter:

```
package:com.nexmile.app nexmile.api
```

Lines go out through `debugPrint`, so they reach logcat under the `flutter` tag whether or not a
debugger is attached — `dart:developer`'s `log()` only reaches the VM service, which is why the
filter matches on the `[nexmile.api]` prefix rather than on a tag.

A call looks like this:

```
[nexmile.api] → POST /v1/auth/otp/request
   headers: {Accept: application/json, Content-Type: application/json}
   payload: {
     "phone": "9876543210"
   }
[nexmile.api] ← ✓ 200 POST /v1/auth/otp/request  (412ms)
   response: {
     "message": "Code sent",
     "data": { "resend_after": 60, "debug_code": null }
   }
```

**Nothing is logged from a release build.** Every method is a no-op behind `kDebugMode`, so the
tree shaker removes the whole file — a shipped app cannot leak a customer's session. Even in debug,
`Authorization` is reduced to `<redacted N chars>` (so "was a token attached?" stays answerable) and
`code`, `password`, `token`, `access_token` and `refresh_token` are replaced with `<redacted>`.
Bodies over 2000 characters are truncated, because Logcat drops long lines rather than wrapping
them.

## A note on decoding

The generated schema types several numerics and booleans as `string`, and money arrives as a JSON
number in some places and a decimal string in others. Every scalar is coerced on the way in — see
the helpers at the top of
[storefront_models.dart](../lib/features/catalogue/data/storefront_models.dart). A storefront that
crashes because a price came back as `"249.00"` is not worth shipping.
