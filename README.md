# 🍔 GoFood

> A cross-platform food ordering and delivery application built with Flutter.

[![Flutter](https://img.shields.io/badge/Flutter-3.7+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.7+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-In%20Progress-yellow)]()
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-blue)]()

---

## 📖 Overview

GoFood is a full-featured food ordering application that lets users browse meals and recipes, view detailed nutritional and ingredient information, and purchase items seamlessly via Stripe. It features a complete authentication flow — email/password sign-up with verification, Google sign-in, and password reset — wrapped in a modern, animated UI.

Built with **Flutter** and **BLoC/Cubit** state management, GoFood follows the **MVVM (Model-View-ViewModel)** pattern with Cubits acting as ViewModels, making it scalable and maintainable.

---

## ✨ Features

- **On-boarding Screens** — Engaging PageView introduction for first-time users
- **Authentication** — Email/password sign-up with email verification, sign-in, and password reset
- **Google Sign-In** — One-tap authentication via Firebase + Google Sign-In
- **Meal Browsing** — Browse meals from TheMealDB in a horizontal "Top of Week" carousel
- **Recipe Catalog** — Infinite-scroll recipe grid from DummyJSON with pagination
- **Recipe Details** — Full-screen view with ingredients, rating, and nutritional info
- **Stripe Payments** — Integrated payment processing via `pay_with_stripe`
- **Animated UI** — Smooth animations powered by `flutter_animate`
- **Responsive Design** — Adaptive text sizing across screen sizes
- **Bottom Navigation** — Curved navigation bar (Home, Favorites, Profile)

---

## 🏗️ Architecture

The project follows the **MVVM (Model-View-ViewModel)** pattern with **BLoC/Cubit** serving as the ViewModel layer and a **Repository pattern** for data access.

```
┌──────────────────────────────┐
│   View (Widgets / Screens)   │  — UI layer, observes state
├──────────────────────────────┤
│ ViewModel (Cubit / Bloc)     │  — Business logic, state management
├──────────────────────────────┤
│   Model (Repos / Services)   │  — Data layer, API calls, Firebase
└──────────────────────────────┘
```

- **View** — Stateless/Stateful widgets that listen to Cubit state and render UI
- **ViewModel (Cubit)** — Manages UI state (loading, success, failure) and business logic
- **Model** — Repositories, data sources (REST APIs, Firebase), and service classes
- **Repository** — Abstracts data sources behind a uniform interface
- **Dartz `Either`** — Handles errors functionally in the repository layer
- **GoRouter** — Provides declarative, type-safe routing

---

## 🛠️ Tech Stack

| Category       | Technology                                      |
|----------------|-------------------------------------------------|
| **Framework**  | Flutter & Dart                                  |
| **State Mgmt** | flutter_bloc (Cubit)                            |
| **Routing**    | go_router                                       |
| **Networking** | Dio                                             |
| **Auth**       | Firebase Auth, google_sign_in                   |
| **Backend**    | Firebase (Auth, Firestore), Cloud Firestore     |
| **Payments**   | Stripe (pay_with_stripe)                        |
| **Error Handling** | dartz (Either)                              |
| **Animation**  | flutter_animate                                 |
| **UI**         | curved_navigation_bar, form_builder_validators  |
| **APIs**       | TheMealDB, DummyJSON                            |

---

## 📂 Project Structure

```
lib/
├── main.dart                        # Entry point, Firebase init, routing
├── firebase_options.dart            # Auto-generated Firebase config
├── Core/
│   ├── apiService.dart              # Dio HTTP client
│   ├── appRouting.dart              # GoRouter configuration
│   ├── appStyles.dart               # Text scaling & themes
│   ├── authService.dart             # Firebase Auth wrapper
│   ├── stripeService.dart           # Stripe payment integration
│   ├── Failure.dart                 # Error handling models
│   ├── customButton.dart            # Shared button widget
│   ├── customAppBar.dart            # Shared app bar widget
│   └── customSnackBar.dart          # Shared snack bar widget
└── Features/
    ├── appView/                     # Splash screen (3s logo display)
    ├── splashView/                  # On-boarding PageView
    ├── signIn/                      # Sign-in screen (email + Google)
    ├── signUp/                      # Registration screen
    ├── VerifiyView/                 # Email verification (OTP)
    ├── forgotpassword/              # Password reset flow (3 steps)
    └── home/
        ├── data/
        │   ├── models/             # Meal & Recipe models
        │   └── repos/              # Repository (impl + abstract)
        ├── Details/                # Recipe detail screen
        └── presentation/views/
            ├── homeview.dart       # Main home screen
            ├── manager/            # Cubits & states
            └── widgets/            # Reusable UI components
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (^3.7.0)
- [Firebase project](https://console.firebase.google.com) with Auth and Firestore enabled
- Stripe account (for payment integration)

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/gofood.git
cd gofood

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase Setup

1. Create a Firebase project and enable **Authentication** (Email/Password + Google)
2. Register your app platforms (Android, iOS, Web, etc.) in Firebase Console
3. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
4. Place them in the respective platform directories

### Stripe Configuration

Create `lib/Core/apiKeys.dart` with your Stripe keys:

```dart
class Apikeys {
  static const String publishableKey = 'your_publishable_key';
  static const String secretKey = 'your_secret_key';
  static const String customId = 'your_customer_id';
}
```

---

<!-- ## 📸 Screenshots -->

<!-- Add screenshots here once available -->


---

## 🔌 API Reference

GoFood consumes two external REST APIs:

| API | Endpoint | Usage |
|-----|----------|-------|
| [TheMealDB](https://www.themealdb.com/api.php) | `filter.php?a=Croatian&c=Chicken` | Browse meals by category |
| [DummyJSON](https://dummyjson.com/docs/recipes) | `/recipes?limit=10&skip=0` | Recipe catalog with pagination |

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. Fork the repository
2. Create a feature branch (`git checkout -b feat/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feat/amazing-feature`)
5. Open a Pull Request

Please ensure your code follows the existing style and passes all analysis checks.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 👤 Author

**Zeyad** — [@your-zeyadeldesouki](https://github.com/zeyadeldesouki)

