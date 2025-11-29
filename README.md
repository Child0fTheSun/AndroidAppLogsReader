<div><h1 align="center">Android App Logs Reader</h1></div>

A Flutter application designed to read, parse, and filter `.logcat` files exported from Android Studio. This tool provides a user-friendly interface to analyze Android application logs with advanced filtering capabilities and color-coded log levels.

## ✨ Features

- **Log File Parsing**: Open and parse `.logcat` files exported from Android Studio.
- **Advanced Filtering**: Filter logs by package name, tag, or message content using Android Studio style syntax (e.g., `package:com.example`, `tag:MyTag`).
- **Color-Coded Logs**: Visual distinction between log levels (Verbose, Debug, Info, Warn, Error, Assert).
- **History**: Quickly access recently opened log files.
- **Theme Support**: Light and Dark modes with system setting integration.
- **Localization**: Support for English and Russian languages.
- **Scroll to Top**: Convenient button to quickly scroll to the top of the log list.

## Usage

1.  Launch the application.
2.  Click the folder icon in the top right corner to open a `.logcat` file.
3.  Use the search bar to filter logs.
    -   Type `package:com.myapp` to filter by package.
    -   Type `tag:Network` to filter by tag.
    -   Type any text to search within the log message.
4.  Access settings to change the theme or language.

## 🛠 Tech Stack

### Core
- **Flutter** 3.8.1+
- **Dart** 3.8.1+

### Architecture & State Management
- **MVVM**: Architectural Pattern
- `provider`: State Management
- `get_it`: Dependency Injection
- `go_router`: Navigation

### UI/UX
- **Material Design 3**: Design System
- `google_fonts`: Typography
- `flutter_svg`: Vector Graphics Support

### Utilities
- `flutter_secure_storage`: Secure data persistence
- `file_picker`: Native file selection
- `url_launcher`: Launching URLs
- `package_info_plus`: App version information
- `logger`: Advanced logging
- `intl`: Internationalization and localization

## 📋 Requirements

- Flutter SDK: `>=3.8.1`
- Dart SDK: `>=3.8.1`
- Android SDK: minimum API 21 (Android 5.0)
- iOS: minimum iOS 12.0

## 🚀 Getting Started

### Prerequisites

-   [Flutter SDK](https://flutter.dev/docs/get-started/install) (latest stable version)
-   Dart SDK

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/Child0fTheSun/as_app_logs_reader.git
    ```
2.  Navigate to the project directory:
    ```bash
    cd as_app_logs_reader
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```
4.  Run the application:
    ```bash
    flutter run
    ```

### Localization

The application supports multilingualism. Localization files are generated automatically from ARB files according to the settings in `l10n.yaml`.

### Application Icon
To change the icon, edit `flutter_launcher_icons.yaml` and run:
```bash
flutter pub run flutter_launcher_icons:main
```

### Splash Screen
To change the splash screen, edit `flutter_native_splash.yaml` and run:
```bash
flutter pub run flutter_native_splash:create
```