import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_mosaic/models/category.dart';
import 'package:quiz_mosaic/models/question.dart';

void main() {
  test('Category has 8 entries', () {
    expect(Category.all.length, 8);
  });

  test('Question fromJson parses correctly', () {
    final json = {
      'id': 'test1',
      'categoryId': 'science',
      'questionText': 'Test?',
      'choices': ['A', 'B', 'C', 'D'],
      'correctIndex': 0,
    };
    final q = Question.fromJson(json);
    expect(q.id, 'test1');
    expect(q.correctIndex, 0);
    expect(q.choices.length, 4);
  });
}
