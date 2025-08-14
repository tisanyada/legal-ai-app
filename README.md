## legalai

Flutter app for LegalAI.

### Prerequisites

-   Flutter SDK installed
-   Dart SDK (bundled with Flutter)

### 1) Environment variables

Create a `.env` file in the project root. The app loads it in `main.dart` using `flutter_dotenv`.

Example `.env`:

```
INFRA_BASE_URL=https://dev.api.example.com
# Optional: keep for reference; by default the app uses INFRA_BASE_URL
INFRA_PROD_URL=https://api.example.com
```

### 2) How BASE URLs are used

The SDK clients and shared `Dio` instance read the base URL from the environment.

```16:23:lib/core/providers/index.dart
static Dio dioBaseOptions = Dio(BaseOptions(
  baseUrl: dotenv.env['INFRA_BASE_URL']!,
  sendTimeout: const Duration(milliseconds: 15000),
  connectTimeout: const Duration(milliseconds: 15000),
  receiveTimeout: const Duration(milliseconds: 15000),
));
```

```48:52:lib/core/providers/index.dart
static LegalSdk legalSdk = LegalSdk(
  dio: dioBaseOptions,
  basePathOverride: dotenv.env['INFRA_BASE_URL']!,
);
```

This means all network calls point to `INFRA_BASE_URL`.

### 3) Switching environments

-   Preferred: point `INFRA_BASE_URL` in `.env` to the desired environment (dev/staging/prod).
-   Alternative: the file has commented lines for `INFRA_PROD_URL`. You can swap to those in `lib/core/providers/index.dart` if you prefer keeping both envs in the file.

### 4) Run the app

```
flutter pub get
flutter run
```

Optionally target a specific device:

```
flutter run -d ios
flutter run -d android
flutter run -d chrome
```

### Notes

-   The app loads `.env` early in `main()` and uses it across services via the `ServiceRegistry` in `lib/core/providers/index.dart`.

### Infra SDK (generate/update)

The SDKs for `auth`, `account`, and `legal` are generated from your OpenAPI specs using scripts in `lib/data/scripts/`. Output goes to `lib/data/infra_sdk/` and is consumed via path dependencies in `pubspec.yaml`.

Prerequisites:

-   Java (JDK 8+)
-   OpenAPI Generator CLI installed (one of):
    -   Homebrew: `brew install openapi-generator`
    -   Node: `npm i -g @openapitools/openapi-generator-cli`

OpenAPI spec endpoints expected by scripts (adjust in scripts if different):

-   `http://localhost:3000/docs/auth-service-json`
-   `http://localhost:3000/docs/account-service-json`
-   `http://localhost:3000/docs/legal-service-json`

Initial generation (first time):

```
cd lib/data/scripts
sh create-infra-sdk.sh
```

Regenerate after API changes (dev):

```
cd lib/data/scripts
sh update-infra-sdk.sh
```

Regenerate for production specs (if your prod specs are wired in the prod script):

```
cd lib/data/scripts
sh update-infra-sdk-prod.sh
```

What the scripts do:

-   Generate Dart clients into `lib/data/infra_sdk/{auth,account,legal}`
-   Normalize SDK headers/versions and dependencies
-   Build each package with `build_runner`

Using the generated SDKs:

-   They are already referenced as path dependencies in `pubspec.yaml` (`auth_sdk`, `account_sdk`, `legal_sdk`).
-   Base URL is injected via `.env` and `ServiceRegistry` (`lib/core/providers/index.dart`) so calls go to `INFRA_BASE_URL`.
-   To switch environments, update `INFRA_BASE_URL` in `.env` and restart the app.
