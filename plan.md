# General Knowledge Quiz App — Plan

## Overview
A Flutter mobile app that presents multiple-choice general knowledge quizzes across various categories. No authentication required.

## Core Features
1. **Category Selection** — Browse and pick a quiz category
2. **Quiz Session** — Answer multiple-choice questions one by one
3. **Result Screen** — Show score, correct/incorrect answers, and summary
4. **Offline-First** — Bundled questions, no network dependency

## Categories (tentative)
- Science & Nature
- History
- Geography
- Sports
- Entertainment (Movies, Music, TV)
- Technology
- Literature
- Random Mix

## Data Model

```
Category {
  id: String
  name: String
  icon: IconData
  color: Color
}

Question {
  id: String
  categoryId: String
  questionText: String
  choices: List<String>
  correctIndex: int
  difficulty: enum (easy/medium/hard)
}
```

Questions will be stored locally as a JSON asset file — no backend needed.

## Screen Flow

```
HomeScreen (categories grid)
  → QuizScreen (question card, 4 choices, next button)
    → ResultScreen (score, retry, back to home)
```

- **HomeScreen**: Grid of category cards with name, icon, color
- **QuizScreen**: Progress bar, question text, 4 option buttons, next/submit button
- **ResultScreen**: Score (X/10), list of questions with correct/incorrect indicators, play again / home buttons

## State Management
Use `StatefulWidget` or `Provider` for simplicity.

## Tech Stack
- Flutter (latest stable)
- No external packages beyond default Flutter SDK (optional: `provider` for state)

## Project Structure

```
lib/
├── main.dart
├── models/
│   ├── category.dart
│   └── question.dart
├── data/
│   └── questions.json        # bundled question bank
├── screens/
│   ├── home_screen.dart
│   ├── quiz_screen.dart
│   └── result_screen.dart
└── widgets/
    ├── category_card.dart
    ├── question_card.dart
    └── option_button.dart
```

## Implementation Order

1. Create Flutter project, set up folder structure
2. Define data models (`Category`, `Question`)
3. Write `questions.json` with initial question bank (~10–20 per category)
4. Build `HomeScreen` with category grid
5. Build `QuizScreen` with question flow
6. Build `ResultScreen` with score summary
7. Wire everything together in `main.dart`
8. Polish UI (theming, animations, responsive layout)
