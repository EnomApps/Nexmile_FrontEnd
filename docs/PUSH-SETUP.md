# Push notifications — what is built, and what is left

The app-side work is done and tested. What remains needs credentials only the
Nexmile Firebase project can provide, so it is deliberately isolated behind one
interface: nothing else changes when it lands.

## Built, and covered by tests

| Piece | Where | Note |
|---|---|---|
| Device registration | [device_repository.dart](../lib/features/auth/data/device_repository.dart) | `POST /v1/devices` and `DELETE /v1/devices`. |
| Lifecycle | [device_registrar.dart](../lib/core/push/device_registrar.dart) | Registers after sign-in, on every token rotation, and once at launch on a restored session. Withdraws on sign-out **before** the session is cleared — after that the call can only 401. Every failure is swallowed: push is a convenience and must never break a sign-in or hold up a sign-out. |
| Auth hooks | [auth_controller.dart](../lib/features/auth/state/auth_controller.dart) | `_persist` registers; `signOut`, `signOutEverywhere` and `deleteAccount` withdraw first. |
| Tap routing | [push_destination.dart](../lib/core/push/push_destination.dart) | `data.order_id` → the order screen. FCM flattens data values to strings, so `"42"` is parsed as well as `42`. An unrecognised push lands **nowhere** — opening the wrong screen is worse than opening none. |
| Channel id | [push_service.dart](../lib/core/push/push_service.dart) | `nexmile_orders`, in one constant. Created at launch, not at sign-in: a mismatch is silent — Android drops the notification with no log line. |
| Transport seam | [push_service.dart](../lib/core/push/push_service.dart) | `NoopPushService` is what ships today. The app builds, signs in and takes orders exactly as it does now, with nothing to register and no tap to route. |

## What is needed to switch it on

1. **`google-services.json`** for the Android app (`com.nexmile.app`), from the
   Firebase console → Project settings → Your apps. Drop it at
   `android/app/google-services.json`.
2. **iOS only** — `GoogleService-Info.plist` plus an APNs auth key uploaded to
   Firebase. Skip if Android ships first.
3. **Confirmation of the `POST /v1/devices` payload.** Built to the obvious
   shape, and a one-line change if it differs:
   ```json
   POST /v1/devices     { "token": "<fcm token>", "platform": "android" }
   DELETE /v1/devices   { "token": "<fcm token>" }
   ```
   Specifically: is `platform` the right key and are `android`/`ios` the right
   values, does the endpoint want `device_name` (verify already sends one), and
   does `DELETE` read the token from the body or expect it as a query
   parameter?

## The remaining change, once those arrive

Add the packages, add the google-services Gradle plugin, and write a
`FirebasePushService implements PushService` — `token()` from
`FirebaseMessaging.instance.getToken()`, `onTokenRefresh` from
`onTokenRefresh`, `onTap` merging `getInitialMessage()` (the cold-start tap)
with `onMessageOpenedApp`, and `ensureChannel()` creating `nexmile_orders`.
Then swap the one line in [main.dart](../lib/main.dart):

```dart
const PushService pushService = NoopPushService();   // becomes FirebasePushService()
```

Nothing above that line changes, and the tests that cover registration and
routing keep passing untouched — they run against the interface, not Firebase.

**Do not add `firebase_messaging` before `google-services.json` is in place.**
The Gradle plugin fails the Android build outright when the file is missing,
which would leave the repo unbuildable for everyone.
