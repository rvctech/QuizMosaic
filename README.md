# QuizMosaic

A Flutter-based general knowledge quiz app with multiple-choice questions across various categories. No login required — just pick a category and start playing.

## Features

- **8 Categories** — Science, History, Geography, Sports, Entertainment, Technology, Literature, and Random Mix
- **1000+ Questions** — Large question bank so each quiz feels fresh; answers are shuffled randomly
- **Offline-First** — All questions bundled locally, no internet needed
- **Instant Feedback** — See correct/incorrect answers after each question
- **Progress Tracker** — Visual progress bar during the quiz
- **Score Summary** — Results screen with percentage and pass/fail status

## Screenshots

*(Add screenshots here)*

## Getting Started

### Prerequisites

- Flutter SDK (latest stable)
- Android Studio / VS Code with Flutter extension

### Installation

```bash
git clone https://github.com/rvctech/QuizMosaic.git
cd QuizMosaic
flutter pub get
flutter run
```

### Building APK

```bash
flutter build apk --debug
```

The APK will be at `build/app/outputs/flutter-apk/app-debug.apk`.

## Project Structure

```
lib/
├── main.dart              # App entry point & theme
├── models/
│   ├── category.dart      # Category model
│   └── question.dart      # Question model with JSON parsing
├── data/
│   └── questions.json     # 1000+ question bank
├── screens/
│   ├── home_screen.dart   # Category grid
│   ├── quiz_screen.dart   # Quiz flow with random question/answer order
│   └── result_screen.dart # Score summary with Buy Me Coffee dialog
└── widgets/
    ├── app_logo.dart       # QuizMosaic logo with image + text
    ├── category_card.dart  # Category grid card
    ├── question_card.dart  # Question + option buttons
    └── option_button.dart  # Single answer option
```

## Tech Stack

- **Flutter** — UI framework
- **Dart** — Programming language
- **Material 3** — Design system
- **JSON** — Local question bank (no backend)

## Support

If you enjoy the app, consider buying me a coffee via M-Pesa: **0722 555 220**
