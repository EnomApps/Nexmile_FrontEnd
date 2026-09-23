# Push notifications — what is built, and what is left

The transport is wired. What remains is credentials only the Nexmile Firebase
project can provide — and until they are dropped in, the app still builds,
signs in and takes orders with push simply dark.

Firebase project: **`nexmile-e03c1`**. Both apps use the id `com.nexmile.app`.

## Built

| Piece | Where | Note |
|---|---|---|
| Transport | [firebase_push_service.dart](../lib/core/push/firebase_push_service.dart) | FCM behind `PushService`. `start()` returns **null** rather than throwing when the build has no Firebase config, no Play Services, or an unregistered bundle id — [main.dart](../lib/main.dart) then falls back to `NoopPushService`. |
| Device registration | [device_repository.dart](../lib/features/auth/data/device_repository.dart) | `POST /v1/devices` sends `token`, `platform` and `app: "customer"`. `DELETE /v1/devices` sends `token`. |
| Lifecycle | [device_registrar.dart](../lib/core/push/device_registrar.dart) | Registers after sign-in, on every token rotation, and once at launch on a restored session. Withdraws on sign-out **before** the session is cleared — after that the call can only 401. Every failure is swallowed: push is a convenience and must never break a sign-in or hold up a sign-out. |
| Auth hooks | [auth_controller.dart](../lib/features/auth/state/auth_controller.dart) | `_persist` registers; `signOut`, `signOutEverywhere` and `deleteAccount` withdraw first. |
| Tap routing | [push_destination.dart](../lib/core/push/push_destination.dart) | `data.order_id` → the order screen, for every `order.*` type. FCM flattens data values to strings, so `"42"` is parsed as well as `42`. An unrecognised push lands **nowhere** — opening the wrong screen is worse than opening none. |
| Foreground display | [firebase_push_service.dart](../lib/core/push/firebase_push_service.dart) | Android draws nothing in the foreground, so the app draws it. iOS is told to present its own banner, and the app then draws nothing — otherwise every foreground notification arrives twice. |
| Background data messages | `firebaseMessagingBackgroundHandler` | A **data-only** message is drawn by the app; one carrying a `notification` block is already on screen and is left alone. |
| Channel | [push_service.dart](../lib/core/push/push_service.dart) + [AndroidManifest.xml](../android/app/src/main/AndroidManifest.xml) | `nexmile_orders`, in one Dart constant and as the manifest default. Created at launch, not at sign-in: a mismatch is silent — Android drops the notification with no log line. Recreated on every launch because a reinstall wipes it. |
| Sound | `android/app/src/main/res/raw/nexmile.wav`, `ios/Runner/nexmile.caf` | A spoken "Nexmile" in place of the device tone. Currently a placeholder generated from the macOS `say` voice `Tara` (en_IN) — swap both files for a studio recording, keeping the names. |

## What is needed to switch it on

1. **`google-services.json`** for the Android app (`com.nexmile.app`), from
   Firebase console → Project settings → Your apps → Android. Drop it at
   **`android/app/google-services.json`**.

   The google-services Gradle plugin is applied **only when that file exists**
   ([app/build.gradle.kts](../android/app/build.gradle.kts)), so a checkout
   without it still builds — Gradle prints one line saying push will not
   arrive. Nothing else needs changing.

2. **iOS** — `GoogleService-Info.plist` at `ios/Runner/GoogleService-Info.plist`,
   plus an **APNs auth key** (`.p8`, from the Apple Developer account) uploaded
   in Firebase → Project settings → Cloud Messaging. In Xcode, add the **Push
   Notifications** capability and the **Background Modes → Remote
   notifications** capability to the Runner target. iOS push cannot be tested
   on the simulator at all; it needs a real device.

3. **Confirmation of the `POST /v1/devices` payload.** Built to this shape:
   ```json
   POST /v1/devices     { "token": "<fcm token>", "platform": "android|ios", "app": "customer" }
   DELETE /v1/devices   { "token": "<fcm token>" }
   ```
   Open questions for the backend: does `DELETE` read the token from the body
   or expect it as a query parameter, and does the endpoint also want
   `device_name` (verify already sends one)?

## What the server has to send for the sound to play

Android takes the sound from the channel, so it plays as long as the message
lands in `nexmile_orders` — either by naming it, or by default through the
manifest. iOS has no channels: the sound is named per message, and without it
the device plays its own tone.

```jsonc
{
  "android": { "notification": { "channel_id": "nexmile_orders" } },
  "apns":    { "payload": { "aps": { "sound": "nexmile.caf" } } },
  "data":    { "type": "order.accepted", "order_id": "123" }
}
```

A sound longer than 30 seconds is rejected by iOS, which then plays nothing at
all. This one is under a second.

## Testing it end to end

Push needs a real device on Android as well if the emulator image has no Play
Services. With the config file in place:

```bash
flutter run                      # watch the log for the FCM token
```

Then either ask the backend to send one, or from the Firebase console →
Messaging → send a test message to that token. A test that proves the deep
link needs a **data** payload, because a console notification alone carries no
`order_id`:

```json
{ "type": "order.accepted", "order_id": "123" }
```

Types the server sends: `order.placed`, `order.accepted`, `order.rejected`,
`order.ready`, `order.offer`, `order.rider_assigned`, `order.picked_up`,
`order.delivered`, `order.cancelled`. All of them carry `order_id` and all of
them open the order screen; `order.offer` is a rider-app notification and a
customer build should never receive one.
