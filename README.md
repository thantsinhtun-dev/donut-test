# J’Donut Rewards

A Flutter sample app for J’Donut, with onboarding and fake phone authentication, a locally available Home and Product experience, and a Rewards screen.

## Run the app

Requirements used for this project:

- Flutter 3.47.6 (stable)
- Dart 3.13.5

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

The generated Freezed and Hive files are checked in. Run the build runner command after changing annotated models or states.

To configure background Home refresh, provide a URL that returns a JSON document matching `assets/data/home_seed.json`:

```sh
flutter run --dart-define=HOME_CONTENT_URL=https://example.com/home.json
```

Without that define, the app uses local data only.

## Architecture

The code is organized by feature, with presentation, domain, and data layers where a feature needs them. Presentation contains Flutter screens, widgets, and Cubits. Domain contains entities, repository contracts, and pure validation rules. Data contains repository implementations and local or remote data sources. Dependency injection and app-wide services live under `lib/core`.

```text
lib/
  core/                 App setup, routing, theme, Hive, network result types
  features/
    auth/               Phone/OTP/registration flow and fake auth repository
    home/               Home content model, sources, repository, Cubit and UI
    product/             Product detail UI
    rewards/             Rewards overview, tasks and progress visuals
  shared/               Reusable form and action widgets
assets/
  data/home_seed.json    Bundled initial Home content
  images/                Bundled visual assets and offline image fallbacks
```

The app uses **Cubit** (`flutter_bloc`) for auth and Home state. The UI depends on repository interfaces; the fake auth and local-first Home implementations live in the data layer. Freezed supplies immutable state and data models. No use-case layer is used.

## Local data and offline behavior

- On first launch, `assets/data/home_seed.json` is copied into the encrypted Hive Home content box. Home reads from Hive, so the seeded member, banners, products, sections, and shops are available offline.
- Home refresh runs in the background when internet access returns and can be triggered with pull-to-refresh. If `HOME_CONTENT_URL` is unset or no remote response is available, the cached Home content remains the source of truth.
- Home and Product detail use the product objects from this content. Rewards reads the same locally stored member profile, keeping the displayed tier and point total consistent.
- Image URLs are loaded with `cached_network_image`; bundled assets are supplied as placeholders and error fallbacks so images remain available without a connection or when a URL fails.
- An offline banner is shown when the device has no internet access. Home content still comes from the local database.
- Auth users and the logged-in session are also stored locally in Hive. Hive is encrypted using a key stored in `flutter_secure_storage`.

## Authentication and validation

Registration flow: phone → OTP → name → date of birth → welcome → Home. Login flow: phone → OTP → Home. A previously unregistered number gets an inline login error with a route to registration. Settings includes Log out; on relaunch, an existing local session opens Home and a logged-out app opens onboarding.

The auth repository is a fake implementation with an approximately one-second delay. The accepted OTP is **`123456`**. Phone, name, and date-of-birth validation is implemented as pure domain functions. OTP input supports six numeric digits, auto-advance, paste, backspace navigation, a resend countdown, and lockout after three invalid attempts until resend. Social sign-in and legal links display placeholders; they do not connect to external services.

## Animations

- Rewards animates the total-points number from zero to the member’s seeded total (650,000) while drawing the donut progress arc.
- Donut reward-task progress uses bundled image variants for its progress states; drink tasks use a cup visual with an arc indicator.
- Invalid OTP feedback shakes and clears the code boxes. Resend displays its cooldown state.

## Known gaps

- There is no production API or server-side authentication. The optional Home endpoint is a single JSON refresh endpoint; no server is configured by default.
- Product, banner, and shop imagery uses sample remote URLs. Bundled fallbacks are used when network images cannot load.
- Authentication is intentionally a local fake flow, so OTP delivery, social login, account recovery, and legal pages are not integrated.
- Home and rewards seed content is sample data. The rewards task progress/actions are presentation data rather than a synced transaction history.

