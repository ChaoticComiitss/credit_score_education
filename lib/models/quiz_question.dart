import 'package:hive/hive.dart';

part 'quiz_question.g.dart';

@HiveType(typeId: 2)
class QuizQuestion {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final List<String> options;

  @HiveField(2)
  final int correctAnswerIndex;

  @HiveField(3)
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.explanation = '',
  });
}