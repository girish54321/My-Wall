# My Wall App

<p align="center">
  <img width="124"  src="assets/appicon/my_wall_icon.png" alt="My Wall App Logo" width="200">
</p>

[![GitHub license](https://img.shields.io/github/license/girish54321/My-Wall)](https://github.com/girish54321/My-Wall/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/girish54321/My-Wall)](https://github.com/girish54321/My-Wall/issues)
[![GitHub stars](https://img.shields.io/github/stars/girish54321/My-Wall)](https://github.com/girish54321/My-Wall/stargazers)

"My Wall" is an open-source Flutter app that allows users to browse, search, and download high-quality images. The app provides a simple and intuitive interface for users to discover and save their favorite images.

## Features

- **Browse Image Library**: Explore a vast collection of images from various categories.
- **Search By Category**: Quickly find images related to your favorite categories.
- **Search Images**: Use the search functionality to find specific images.
- **Download Images**: Download your favorite images with ease.
- **Dark and Light Mode**: Switch between dark and light themes for a personalized experience.
- **Fast and Responsive**: Enjoy a smooth and fast browsing experience.
- **User-friendly Login**: Securely log in without the hassle of token management.

## Screenshots

<img width="1604"  src="appimages/banner.png?raw=true">

## MacOS

<img width="1604"  src="appimages/macos.png?raw=true">

## Installation

[<img src="https://github.com/NeoApplications/Neo-Backup/blob/034b226cea5c1b30eb4f6a6f313e4dadcbb0ece4/badge_github.png?raw=true"
    alt="Get it on GitHub"
    height="80">](https://github.com/girish54321/My-Wall/releases/)

<!-- [<img src="https://gitlab.com/IzzyOnDroid/repo/-/raw/master/assets/IzzyOnDroid.png"
     alt="Get it on IzzyOnDroid"
     height="80">](YOUR LINK)
[<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
     alt="Get it on F-Droid"
     height="80">](YOUR_LINK) -->

## Getting Started

Follow these steps to get started with "My Wall" app:

Clone the project

```bash
  git clone https://github.com/girish54321/My-Wall.git
```

## Flutter Doctor for the Repo

```bash
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.13.9, on macOS 13.5.1 22G90 darwin-x64, locale
    en-IN)
[!] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
    ✗ cmdline-tools component is missing
      Run `path/to/sdkmanager --install "cmdline-tools;latest"`
      See https://developer.android.com/studio/command-line for more details.
    ✗ Android license status unknown.
      Run `flutter doctor --android-licenses` to accept the SDK licenses.
      See https://flutter.dev/docs/get-started/install/macos#android-setup for
      more details.
[✓] Xcode - develop for iOS and macOS (Xcode 14.3.1)
[✗] Chrome - develop for the web (Cannot find Chrome executable at
    /Applications/Google Chrome.app/Contents/MacOS/Google Chrome)
    ! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.
[✓] Android Studio (version 2022.3)
[✓] VS Code (version 1.85.1)
[✓] Connected device (1 available)
[✓] Network resources
```

```bash
flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-mywall_dev.yaml  && flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-mywall_qa.yaml && flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons-mywall.yaml
```

## Create APK

```bash
  flutter build apk --release -t lib/main_mywall_dev.dart --flavor mywall_dev
```

```bash
  flutter build apk --release -t lib/main_mywall.dart --flavor mywall
```
