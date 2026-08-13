# Nexmile — customer app

**Fast Delivery. Fresh Smiles.**

Flutter front-end for the Nexmile customer app, targeting Android and iOS.
Built against the Nexmile REST API (`document.json`, OpenAPI 3.1).

---

## Current state

| Area | Status |
|---|---|
| Splash animation | Done — 3s scripted sequence |
| Language selection | Done — English + all 22 Eighth Schedule languages |
| Sign-in (OTP) | Done — wired to the live API |
| Profile | Done — read-only, backed by `GET /v1/profile` |
| Address book | Done — GPS, map pin, 1 km radius, `/v1/addresses` |
| Storefront | **Prototype** — full journey on sample data, no API yet |
| Address onboarding | **Not built.** See [What's next](#whats-next) |

---

## Running it

```bash
flutter pub get
flutter run
flutter build apk --release
flutter build ipa --release        # needs macOS + Xcode
```

### Pointing at a backend

The base URL defaults to production. Override it at build time:

```bash
# Android emulator -> host machine's localhost
flutter run --dart-define=NEXMILE_API_BASE_URL=http://10.0.2.2:8000/api

# Physical device -> your machine on the LAN
flutter run --dart-define=NEXMILE_API_BASE_URL=http://192.168.1.5:8000/api
```

`http://` traffic is blocked by default on both platforms. For local
development against a plain-HTTP server you will need a debug-only
network-security config on Android and an ATS exception on iOS.

### Getting a code while there is no SMS gateway

The API writes OTP codes to `storage/logs/laravel.log` instead of sending
them, and returns the code in `data.debug_code` outside production. The OTP
screen renders that as a one-tap "Development code" card. The card is gated on
`kReleaseMode`, so a misconfigured production response can never leak a live
code into a shipped build.

---

## Screen flow

```
splash (3s)
   ├─ no language chosen ──► language selection ──► sign in
   ├─ language chosen, no session ──► sign in
   └─ session restored from keystore ──► dashboard

sign in  (email or mobile) ──► OTP ──► app shell
                                        ├── Home    ──► restaurant ──► cart ──► order tracking
                                        ├── Search
                                        ├── Orders  ──► reorder
                                        └── Profile
```

## Storefront prototype

Everything after sign-in runs on invented data in
`lib/features/catalogue/data/sample_catalogue.dart`: seven restaurants, full
menus, categories and offers. The whole journey works — browse, filter by
category, search, open a menu, add to cart, check out, watch the order move
through four tracking stages, then reorder from history.

**Swapping in the real API** is a one-file change: implement
`CatalogueRepository` (six methods) against HTTP and hand it to the screens.
Nothing in the UI touches `SampleCatalogue` directly.

Three behaviours that are real logic rather than mock-ups, and should survive
the API swap:

- **One restaurant per cart.** Adding a dish from another kitchen prompts before
  clearing — orders cannot span restaurants, so mixing them would only fail at
  checkout.
- **Bill arithmetic.** ₹29 delivery, waived over ₹299 or on free-delivery
  restaurants, plus 5% GST. See `BillSummary`.
- **Order snapshots.** Checkout copies the lines out of the cart, so editing the
  cart afterwards cannot rewrite order history.

Two things are deliberately fake and marked as such in the UI: **tracking**
advances on a timer (delete the timer in `order_status_screen.dart` and drive
`PlacedOrder.status` from the server), and **no payment is taken**.

Sample content — restaurant names, dish names, cuisines — is English only. It
stands in for API content, so translating it 23 ways would be work that gets
deleted. All UI chrome around it *is* fully translated.

There is no photography: each dish and restaurant renders its emoji on a
brand-tinted gradient (`FoodImage`), keyed off its id so the same restaurant
always looks the same. That keeps the prototype free of network image loads.

The profile screen renders the cached user immediately and refreshes from
`GET /v1/profile` in the background, so it is never blank on a slow connection.
A failed refresh shows a retry banner *above* the cached data rather than
replacing it — a customer's name does not stop being true because the network
dropped. It is read-only for now; `PATCH /v1/profile` (name, email, phone,
`preferred_locale`) is where an edit screen would hook in.

There is no registration, forgot-password or reset-password screen, because
the API has no such endpoints for customers. `POST /v1/auth/otp/request`
accepts an unknown address or number, and the account is created on the first
successful verification — so one screen serves new and returning customers
alike. Customers come back `active` immediately; there is no approval gate
(unlike riders, who come back `pending`).

---

## API surface used

Only the customer-facing endpoints:

| Method | Path | Used for |
|---|---|---|
| POST | `/v1/auth/otp/request` | Send a code to an email or mobile number |
| POST | `/v1/auth/otp/verify` | Verify the code, create/return the session |
| POST | `/v1/auth/refresh` | Swap an expired access token |
| POST | `/v1/auth/logout` | Revoke this device |
| GET | `/v1/profile` | The profile screen |
| GET | `/v1/auth/me` | Session check (implemented, no caller yet) |
| GET | `/v1/addresses` | Address book, and the post-login branch |
| GET | `/v1/addresses/{id}` | Re-read before editing |
| POST | `/v1/addresses` | Save a new address |
| PATCH | `/v1/addresses/{id}` | Correct an existing address |
| DELETE | `/v1/addresses/{id}` | Delete an address |
| POST | `/v1/addresses/{id}/default` | Change the default |

All six address endpoints are wired. Two behaviours come straight from the
spec and are easy to get wrong:

- **Delete promotes a new default.** The API soft-deletes and promotes the next
  most recent address, so `AddressController.delete` re-reads the list when the
  deleted one was the default — dropping the row locally would leave the book
  showing no default while the server has one.
- **Edit re-reads first.** `GET /v1/addresses/{id}` runs before the edit screen
  opens, so a copy changed on another device is not overwritten with whatever
  this device last cached. If that read fails, editing falls back to the cached
  copy rather than blocking.

`/v1/profile` and `/v1/auth/me` return the same `UserResource` for a customer —
the `merchant` block in the schema is only populated on merchant accounts. The
profile screen uses `/v1/profile` because that is what it is for; `/v1/auth/me`
stays available as the cheap "is this session still good" call.

Not used: everything under `/v1/merchant/*`, `/v1/rider/*` and `/v1/admin/*`.

`intended_role: customer` is sent on every code request.

### Two API contract details worth knowing

**`Accept: application/json` on every request.** Without it a validation
failure returns an HTML redirect instead of a 422 carrying the field errors.
`ApiClient` sets it unconditionally; there is a test asserting it.

**Refreshes are serialised behind a single lock.** Two concurrent refreshes
look like a stolen token to the API and sign the customer out of every device.
`ApiClient` holds the in-flight refresh so parallel 401s all await the same
call, and retries each request at most once. There is a test for that too.

### Error handling

Server messages are English-only and are never rendered. HTTP status codes map
to `ApiErrorKind`, then to the `AuthFailure` enum, then to an ARB string — so
every error a customer sees is in their own language.

| Status | Shown as |
|---|---|
| 403 | Account suspended |
| 422 (request) | Invalid email or mobile number |
| 422 (verify) | Wrong or expired code |
| 429 | Too many attempts |
| 401 after a failed refresh | Session expired |
| network / timeout | No internet connection |

---

## Brand

Every colour is sampled from `assets/images/nexmile_logo.png` and lives in
`lib/core/theme/app_colors.dart`:

| Role | Value |
|---|---|
| Brand green (light → deep) | `#9DCD2B` → `#2C8B0D` |
| Brand orange (light → deep) | `#FF8406` → `#FF5400` |
| Splash burst | `#FF7A00` |
| Backdrop | `#000000` |

Light and dark themes are both defined and follow the system setting. The
splash is always black, matching the logo lockup.

### Assets

| File | Purpose |
|---|---|
| `nexmile_logo.png` | Full lockup, as supplied |
| `nexmile_symbol.png` | "N + pin", transparent background |
| `nexmile_wordmark.png` | "Nexmile", transparent background |
| `nexmile_mark.png` | Square mark on black, for in-app tiles |
| `icon/nexmile_icon.png` | Launcher / store icon |
| `icon/nexmile_icon_fg.png` | Android adaptive-icon foreground |

Regenerate icons and native splash with:

```bash
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```

> `flutter_native_splash:create` overwrites `android/app/src/main/res/values*/styles.xml`
> and resets `NormalTheme`'s `windowBackground` to `?android:colorBackground`
> (white in light mode), which flashes white before the black splash paints.
> After running it, set that back to `@android:color/black` in both
> `values/styles.xml` and `values-v31/styles.xml`.

---

## Splash animation

One 3.0s `AnimationController` drives every layer, so the whole sequence shares
a clock and stays on one vsync.

| Time | Beat |
|---|---|
| 0.00–0.20s | Pure black |
| 0.20–0.35s | Orange dot pops in at the exact centre |
| 0.35–1.26s | Expands, ease-out, until it covers the screen |
| 0.90–1.50s | Fill dissolves to a soft glow; symbol + wordmark fade in |
| 1.56–2.25s | Light sweeps across the "N" and the pin |
| 1.68–2.16s | Tagline arrives |
| 2.04–2.88s | Four feature icons stagger in |
| 3.00s | Hand-off to the next screen |

The orange fill **dissolves** rather than staying full-bleed: the artwork is
green, orange and white, and none of it reads against a solid orange field.
What remains is a centred orange glow behind the mark.

---

## Languages

23 in total: English (the default) plus all 22 languages in the Eighth Schedule
to the Constitution of India.

Assamese · Bengali · Bodo · Dogri · Gujarati · Hindi · Kannada · Kashmiri ·
Konkani · Maithili · Malayalam · Manipuri · Marathi · Nepali · Odia · Punjabi ·
Sanskrit · Santali · Sindhi · Tamil · Telugu · Urdu

> **Mismatch with the API.** `PATCH /v1/profile` accepts `preferred_locale` of
> only `en`, `ta` or `hi`. The app therefore keeps the chosen language locally
> and does not sync it to the profile — a customer using Malayalam would get a
> 422. Either widen the server-side enum to the 23 the app ships, or accept
> that the server-side preference stays unset.

### Translation review status

English and Tamil were treated as the priority pair and are the most carefully
worded. The following are **machine-assisted and want a native-speaker pass
before release** — the UI is correct, the wording may not be idiomatic:

> Bodo · Dogri · Kashmiri · Konkani · Maithili · Manipuri · Santali

Manipuri is written in the Bengali script rather than Meetei Mayek, because
Meetei Mayek has no guaranteed system font on iOS and would render as tofu
boxes on many devices.

### Adding or changing a string

1. Add the key to `lib/l10n/app_en.arb` with an `@key` description.
2. Add it to the other 22 files.
3. `flutter pub get`.

`flutter test` fails if any locale is missing a key, silently reuses an English
string, or drops a `{placeholder}`.

### Material chrome fallback

`flutter_localizations` has no bundled Material/Cupertino translations for Bodo,
Dogri, Kashmiri, Konkani, Maithili, Manipuri, Sanskrit, Santali or Sindhi.
Without a delegate that accepts those locales the app throws
"No MaterialLocalizations found" the moment a `Scaffold` builds — a crash in
nine of twenty-three languages. `lib/core/localization/fallback_localizations.dart`
registers catch-all delegates *after* the global ones, so Flutter's own
translations win where they exist and only the rest fall back to English widget
chrome. App copy is unaffected.

---

## Text layout

The brief was explicit about no overlapping or misaligned text. Indic scripts
stack vowel signs above and below the base glyph and need more vertical room
than Latin at the same size. The measures:

- Line heights never below 1.28; body copy at 1.5.
- `TextLeadingDistribution.even` on every style — splits extra leading above
  *and* below the glyph instead of dumping it below, which is the usual cause
  of clipped Tamil and Devanagari ascenders in tight rows.
- No negative letter spacing; it collides conjunct clusters.
- System text scale clamped to 0.9–1.3 in `app.dart`.
- Language tiles and OTP boxes shrink-to-fit via `FittedBox`, with heights
  derived from the live text scale.
- Every screen scrolls. Long translations plus a keyboard on a small phone will
  exceed the viewport, and a fixed header overflows rather than scrolling.
- Emails, phone numbers and OTP digits are pinned left-to-right even in Urdu,
  Kashmiri and Sindhi, because those values are themselves LTR. Language names
  render in **their own** direction, so `اردو` stays right-to-left inside an
  otherwise left-to-right list.

`flutter test` asserts all of this: it pumps every screen in all 23 locales, and
at 320×568 with the maximum text scale, failing on any overflow.

---

## Architecture

```
lib/
├── app.dart                     MaterialApp, providers, locale + direction
├── main.dart                    bootstrap and dependency wiring
├── core/
│   ├── config/                  build-time config (API base URL)
│   ├── constants/               asset paths
│   ├── localization/            language catalogue, locale controller, fallbacks
│   ├── network/                 ApiClient, ApiException
│   ├── router/                  routes + typed route arguments
│   ├── services/                SharedPreferences wrapper
│   ├── theme/                   colours, typography, light + dark themes
│   └── widgets/                 brand mark, gradient button, brand rule
├── features/
│   ├── auth/
│   │   ├── data/                LoginIdentifier, AuthUser, AuthSession,
│   │   │                        TokenStore, AuthRepository, AuthFailure
│   │   ├── state/               AuthController
│   │   └── presentation/        login + OTP screens, shared widgets
│   ├── dashboard/
│   ├── language/
│   └── splash/
├── generated/l10n/              generated — do not edit
└── l10n/                        23 ARB files
```

`AuthController` doubles as the `TokenProvider` for `ApiClient`, which is why
`main.dart` builds the client first and attaches the controller afterwards —
the two genuinely reference each other.

### Token storage

Access and refresh tokens live in `flutter_secure_storage` — Keychain on iOS,
EncryptedSharedPreferences on Android. A refresh token is a 30-day credential
and SharedPreferences is readable on a rooted or jailbroken device.
SharedPreferences holds only the chosen language.

---

## What's next

**Address onboarding.** The customer flow expects a saved address after first
sign-in — `POST /v1/addresses` with `latitude`/`longitude` required, since the
1 km radius and zone matching are computed from them. That needs a location
plugin and the runtime permission on both platforms. Nothing gates the main UI
on it (`can_accept_orders` is a rider concept), so it can ship as a prompt on
the dashboard rather than a blocking step.

Also unbuilt but specified: `GET/PATCH /v1/profile`, the address list and the
active-sessions screen (`GET /v1/auth/sessions`).

---

## Platform configuration

**Android** — `com.nexmile.app`, minSdk 23, portrait only, R8 + resource
shrinking on release, adaptive icon on black, INTERNET permission.

Release signing reads `android/key.properties` when present and falls back to
the debug keystore otherwise, so `flutter build apk --release` works out of the
box. Create that file (git-ignored) for a real release:

```properties
storeFile=/absolute/path/to/nexmile.jks
storePassword=...
keyAlias=nexmile
keyPassword=...
```

**iOS** — `com.nexmile.app`, deployment target 12.0, portrait only.
`CFBundleLocalizations` lists all 23 languages; without it iOS reports only the
development region and the App Store page would not show the app as localised.

iOS has not been compiled — this project was developed on Windows, where the
toolchain is unavailable. The configuration is in place; it needs one
`flutter build ipa` on a Mac to confirm.

---

## Tests

```bash
flutter analyze     # clean
flutter test        # 46 tests
```

Coverage: language catalogue integrity; translation completeness and
placeholder survival across all 23 locales; `LoginIdentifier` parsing and
normalisation; `ApiClient` header, error mapping, 401-refresh-retry and
single-flight refresh; the three splash hand-off paths; sign-in happy path and
every API error; code verification, resend cooldown and rejection; sign-out;
and layout robustness for every screen in every language.
