class Question {
  final String id;
  final String categoryId;
  final String questionText;
  final List<String> choices;
  final int correctIndex;
  final String difficulty;

  const Question({
    required this.id,
    required this.categoryId,
    required this.questionText,
    required this.choices,
    required this.correctIndex,
    this.difficulty = 'easy',
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as String,
      categoryId: json['categoryId'] as String,
      questionText: json['questionText'] as String,
      choices: List<String>.from(json['choices'] as List),
      correctIndex: json['correctIndex'] as int,
      difficulty: json['difficulty'] as String? ?? 'easy',
    );
  }
}
