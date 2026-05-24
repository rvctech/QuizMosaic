import 'package:flutter/material.dart';
import '../models/question.dart';
import 'option_button.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  final int questionNumber;
  final int totalQuestions;
  final int? selectedIndex;
  final bool showResult;
  final void Function(int) onOptionSelected;

  const QuestionCard({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.selectedIndex,
    required this.showResult,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: questionNumber / totalQuestions,
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
        const SizedBox(height: 20),
        Text(
          'Question $questionNumber of $totalQuestions',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        ),
        const SizedBox(height: 12),
        Text(
          question.questionText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 24),
        ...List.generate(question.choices.length, (i) {
          return OptionButton(
            text: question.choices[i],
            index: i,
            selectedIndex: selectedIndex,
            isCorrect: i == question.correctIndex,
            showResult: showResult,
            onTap: () => onOptionSelected(i),
          );
        }),
      ],
    );
  }
}
