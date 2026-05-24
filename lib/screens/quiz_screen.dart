import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/category.dart';
import '../models/question.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final Category category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int? _selectedIndex;
  bool _showResult = false;
  int _score = 0;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final jsonString = await rootBundle.loadString('lib/data/questions.json');
    final List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
    final allQuestions = jsonList
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .where((q) =>
            widget.category.id == 'random' || q.categoryId == widget.category.id)
        .toList();

    allQuestions.shuffle(Random());
    final selected = allQuestions.take(10).map((q) {
      final paired = List.generate(q.choices.length, (i) => MapEntry(i, q.choices[i]));
      paired.shuffle(Random());
      final shuffledChoices = paired.map((e) => e.value).toList();
      final newCorrectIndex = paired.indexWhere((e) => e.key == q.correctIndex);
      return Question(
        id: q.id,
        categoryId: q.categoryId,
        questionText: q.questionText,
        choices: shuffledChoices,
        correctIndex: newCorrectIndex,
        difficulty: q.difficulty,
      );
    }).toList();
    setState(() {
      _questions = selected;
      _loading = false;
    });
  }

  void _selectOption(int index) {
    if (_showResult) return;
    setState(() {
      _selectedIndex = index;
      _showResult = true;
      if (index == _questions[_currentIndex].correctIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
        _showResult = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: _score,
            total: _questions.length,
            categoryName: widget.category.name,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.category.name)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final question = _questions[_currentIndex];
    final isLast = _currentIndex == _questions.length - 1;

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: QuestionCard(
                  question: question,
                  questionNumber: _currentIndex + 1,
                  totalQuestions: _questions.length,
                  selectedIndex: _selectedIndex,
                  showResult: _showResult,
                  onOptionSelected: _selectOption,
                ),
              ),
            ),
            if (_showResult)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isLast ? 'See Results' : 'Next Question',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
