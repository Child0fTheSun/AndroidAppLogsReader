<img src="/assets/images/app_icon.png" width="192px" />

# Android App Logs Reader

A Flutter application designed to read and parse `.logcat` files exported from Android Studio. This tool provides a user-friendly interface to analyze Android application logs with advanced filtering capabilities and color-coded log levels.

## ✨ Features

- **Log File Parsing**: Open and parse `.logcat` files exported from Android Studio.
- **Advanced Filtering**: Filter logs by package name, tag, or message content using Android Studio style syntax (e.g., `package:com.example`, `tag:MyTag`).
- **Color-Coded Logs**: Visual distinction between log levels (Verbose, Debug, Info, Warn, Error, Assert).
- **History**: Quickly access recently opened log files.
- **Theme Support**: Light and Dark modes with system setting integration.
- **Localization**: Support for English and Russian languages.
- **Scroll to Top**: Convenient button to quickly scroll to the top of the log list.

## 📸 Screenshots

<img src="/screenshots/home_screen.jpg" width="300px" /> <img src="/screenshots/history_screen.jpg" width="300px" />
<img src="/screenshots/settings_screen.jpg" width="300px" />

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

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these guidelines:

1. **Fork the repository** and create your branch from `main`.
2. **Make your changes** and ensure the code follows the project's coding style.
3. **Test your changes** thoroughly before submitting.
4. **Create a Pull Request** with a clear description of what you've changed and why.

### Reporting Issues

If you find a bug or have a feature request, please [open an issue](https://github.com/Child0fTheSun/AndroidAppLogsReader/issues) with:
- A clear description of the problem or suggestion
- Steps to reproduce (for bugs)
- Expected vs actual behavior
- Screenshots if applicable

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Child0fTheSun

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

**Made with ❤️ using Flutter**