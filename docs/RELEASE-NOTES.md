<title>Nexmile Customer App — Build 1.0</title>

# Nexmile — Customer App

**Build 1.0 · Android · Release**

The customer app is feature-complete against the customer API. Every screen runs
on the live server at `api.nexmile.in` — there is no sample or placeholder data
anywhere in the build.

| | |
|---|---|
| **File to install** | `Nexmile-Customer-v1.0-arm64.apk` (20.9 MB) |
| **Older 32-bit phones** | `Nexmile-Customer-v1.0-arm32.apk` (18.6 MB) |
| **Minimum Android** | 6.0 (API 23) |
| **Backend** | `https://api.nexmile.in/api` (production) |
| **API endpoints wired** | 33 of 33 |
| **Languages** | 23 · 246 translated strings each |
| **Automated tests** | 108 passing |

---

## 1 · Onboarding

| Screen | What it does |
|---|---|
| **Splash** | 3-second branded animation — orange dot expands, logo fades in, shine sweep, tagline, then four feature icons. Runs at 60 fps. |
| **Language** | All 23 official Indian languages. English is the default; English and Tamil lead the list. Searchable. |
| **Sign in** | One field accepting **either** email or mobile number. |
| **OTP** | 6-digit code, 60-second resend cooldown driven by the server. |

**Note on sign-in:** the API has no registration, password or password-reset for
customers. An account is created automatically on the first successful code
verification, so sign-in and sign-up are the same two screens.

## 2 · Location & address book

| Screen | What it does |
|---|---|
| **Permission** | Explains *why* location is needed before the system prompt — delivery radius, pin accuracy, privacy. |
| **Map pin** | Opens on the GPS fix, 1 km delivery circle drawn, pin dragged to adjust. |
| **Address form** | Reverse-geocoded prefill; label, landmark, city, PIN, contact. |
| **Address book** | Add, edit, delete, set default. |

Latitude and longitude are mandatory, so the map step cannot be skipped — only
the GPS part can, in which case the customer drags the pin themselves.

## 3 · Storefront

| Screen | What it does |
|---|---|
| **Home** | Nearby restaurants for the saved delivery address. Distance, prep time, minimum order. |
| **Food Rescue** | Surplus-food deals carousel with discount and portions remaining. |
| **Search** | Server-side search across nearby restaurants, debounced. |
| **Restaurant** | Banner, hours, menu by category, veg/non-veg marks, discount badges. |

A closed shop says **why**: "Not taking orders" when it is inside its hours but
paused, "Closed right now" when it is outside them. Only one of those is worth
waiting for. Sold-out dishes are shown struck through rather than hidden, so a
customer can see the shop has the item and it has simply run out.

## 4 · Cart & checkout

| Screen | What it does |
|---|---|
| **Customise** | Add-on groups with required/optional rules enforced before adding. |
| **Cart** | Quantity stepper, per-item notes, full bill breakdown. |
| **Checkout** | Delivery or pickup, address picker, order note, cash on delivery. |

Carts live on the server, **one per restaurant**, so an unfinished basket
survives closing the app or changing phones. A "you left something at ___"
bar surfaces it on the home screen.

The checkout button is gated on the server's own `can_checkout` flag — which
already accounts for the minimum order, sold-out items and opening hours. The
app never second-guesses it, so what the customer sees always matches what the
kitchen will accept.

## 5 · Orders

| Screen | What it does |
|---|---|
| **Order history** | In-progress orders lifted above completed ones. |
| **Order detail** | Items, full bill, progress timeline, pickup code. |
| **Live tracking** | Refreshes every 8 seconds; delivery partner's name, call button, and live position on a map. |
| **Cancel** | Offered only while the restaurant has not yet accepted. |
| **Tax invoice** | Opens the printable GST invoice. |

Polling stops the moment an order is delivered or cancelled, so a finished order
does not drain the battery.

## 6 · Account

| Screen | What it does |
|---|---|
| **Profile** | Name, email, mobile, verification badge, account status. |
| **Edit profile** | Change name, email and mobile number. |
| **Signed-in devices** | Every device holding a session, with last-used time. Sign out one, or all. |
| **Delete account** | Two-step confirmation. |

Accounts are created named "Nexmile user", so the profile screen prompts for a
real name — that is what the restaurant and the delivery partner see on the
ticket.

Deleting an account is a soft delete on the server: past orders and invoices are
retained for GST records, which is a legal requirement, while the customer is
signed out everywhere.

---

## Languages

All 23 languages of the Eighth Schedule, complete — not partial:

Assamese · Bengali · Bodo · Dogri · **English** · Gujarati · Hindi · Kannada ·
Kashmiri · Konkani · Maithili · Malayalam · Manipuri · Marathi · Nepali · Odia ·
Punjabi · Sanskrit · Santali · Sindhi · **Tamil** · Telugu · Urdu

Every one of the 246 strings is translated in every language — none fall back to
English. Urdu, Kashmiri and Sindhi flip the entire layout right-to-left. Text
scales from 90% to 130% for accessibility without any screen breaking, which is
verified automatically on a 320×568 screen at maximum text size.

Flutter itself ships translations for only 14 of these 23; the app supplies its
own for the remaining 9 so that date pickers and system dialogs do not fall back
to English mid-screen.

---

## Testing

108 automated tests run on every change, covering:

- All 23 languages resolving their own copy, with no accidental English fallback
- Placeholders surviving translation in every language
- Layout on a 320×568 screen at 130% text scale, and right-to-left mirroring
- Token refresh, including concurrent requests sharing a single refresh
- Cart, checkout and order-status rules
- Defensive decoding of the API's mixed data types

---

## Known limitations

Honest notes, all of them backend-side rather than app-side:

1. **Cash on delivery is the only payment method.** The API documents online
   payment as not yet available. The checkout sheet is built to take more
   methods the moment the backend offers them.
2. **Delivery radius is set by the server**, currently 2 km for the nearby
   search. The app displays whatever the server returns.
3. **Live rider tracking depends on the rider app** sending positions. The map
   appears only once a position is being reported.
4. **The account's preferred language** can be one of English, Tamil or Hindi —
   an API constraint. The app still offers all 23 on the phone; the other 20
   simply are not sent to the server.

---

## Installing

1. Copy `Nexmile-Customer-v1.0-arm64.apk` to the phone.
2. Open it. Android will ask permission to install from this source — allow it.
3. Sign in with an email address or mobile number and the code that arrives.
