# Galleria

A comprehensive photo gallery app built with Flutter. Galleria has powerful photo capturing and management capabilities.

## 📱 Features

### 📸 Photo Gallery
- Take photos with the camera in the Galleria app
- Store images to the Galleria folder in the device's gallery
- Browse and manage photos in the Galleria folder from device gallery
- Upload photos to cloud storage (Supabase)

## 🏗️ Architecture

The app follows **Clean Architecture** principles with a feature-first structure:

```
lib/
├── core/                    # Core utilities and shared resources
│   ├── routes/             # Auto-route navigation
│   ├── logger/              # App logging
│   └── constants/            # Shared constants
├── features/               # Feature modules
│   └── home/              # Home screen feature
│       ├── client/        # Data sources / API clients
│       ├── controller/    # State management logic
│       ├── models/        # Data models
│       └── screens/       # UI Screens
├── galleria.dart          # Core app widget
└── main.dart              # Entry point & initialization
```

### State Management
- **Riverpod** for dependency injection and state management
- **Riverpod Annotations** for code generation
- **Freezed** for immutable data models

### Routing
- **Auto Route** for type-safe navigation

## 🛠️ Tech Stack

### Core
- **Flutter SDK**: ^3.10.4
- **Dart**: Latest stable version

### State Management & Architecture
- `flutter_riverpod: ^3.1.0` - State management
- `riverpod_annotation: ^4.0.0` - Code generation for providers
- `freezed: ^3.2.3` - Immutable models
- `json_annotation: ^4.9.0` - JSON serialization

### Navigation
- `auto_route: ^11.1.0` - Type-safe routing

### Backend & Cloud
- `supabase_flutter: ^2.12.0` - Backend as a Service
- Firebase (Core, Messaging, Analytics, Crashlytics)

### Media & Gallery
- `image_picker: ^1.2.1` - Camera and gallery access
- `gal: ^2.3.2` - Gallery management
- `photo_manager: ^3.8.3` - Photo library access
- `photo_manager_image_provider: ^2.2.0` - Image loading

### UI & Design
- `flutter_screenutil: ^5.9.3` - Responsive UI
- `uicons: ^1.0.1` - Icon library
- Cupertino and Material design components

### Utilities
- `flutter_dotenv: ^6.0.0` - Environment variables
- `logger: ^2.6.2` - Logging

### Development Tools
- `build_runner: ^2.10.5` - Code generation
- `auto_route_generator: ^10.4.0` - Route generation
- `riverpod_generator: ^4.0.0+1` - Provider generation
- `json_serializable: ^6.11.2` - JSON serialization
- `flutter_lints: ^6.0.0` - Linting

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.10.4 or higher)
- Dart SDK
- iOS development: Xcode, CocoaPods
- Android development: Android Studio, Android SDK

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/thedevsaxist/galleria.git
   cd galleria
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables**
   
   Create a `.env` file in the root directory:
   ```env
   SUPABASE_URL=your_supabase_url
   SUPABASE_ANON_KEY=your_supabase_anon_key
   SUPABASE_BUCKET_NAME=your_storage_bucket_name
   # Add other environment variables as needed
   ```

4. **Run code generation**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 🔧 Development

### Code Generation

The project uses code generation for routes, providers, and models. After making changes to annotated files, run:

```bash
# Watch mode (recommended during development)
flutter pub run build_runner watch --delete-conflicting-outputs

# One-time build
flutter pub run build_runner build --delete-conflicting-outputs
```

### Project Structure Guidelines

- **Features**: Each feature should be self-contained with its own data, domain, and presentation layers
- **Providers**: Use Riverpod annotations for type-safe provider generation
- **Models**: Use Freezed for immutable data classes
- **Routing**: Define routes using AutoRoute annotations

### State Management Pattern

```dart
// Example provider
@riverpod
class ExampleNotifier extends _$ExampleNotifier {
  @override
  FutureOr<ExampleState> build() async {
    // Initialize state
  }
  
  // Methods to update state
}
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📦 Building for Production

### Android
```bash
flutter build apk --release
# or
flutter build appbundle --release
# or
flutter build apk --release --split-per-abi
```

### iOS
```bash
flutter build ios --release
```

## 🔒 Security

- Environment variables for API keys

## ⚠️ Technical Debt

According to the technical requirements, the only features not included are:
- Scheduled sync
- Local storage of photo metadata

##  Contributors

- [Chidiebube Iroezindu](github.com/thedevsaxist)

## 📞 Support

For issues and questions, please contact the development team.

---
