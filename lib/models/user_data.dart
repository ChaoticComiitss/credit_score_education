// models/user_data.dart
import 'package:hive/hive.dart';

// part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int simulatedScore;

  @HiveField(2)
  int xpPoints;

  @HiveField(3)
  List<String> completedLessons;

  @HiveField(4)
  Map<String, int> quizScores;

  @HiveField(5)
  List<String> earnedBadges;

  @HiveField(6)
  String preferredCurrency;

  UserData({
    required this.name,
    required this.simulatedScore,
    required this.xpPoints,
    required this.completedLessons,
    required this.quizScores,
    required this.earnedBadges,
    required this.preferredCurrency,
  });

  // Add copyWith method for immutability
  UserData copyWith({
    String? name,
    int? simulatedScore,
    int? xpPoints,
    List<String>? completedLessons,
    Map<String, int>? quizScores,
    List<String>? earnedBadges,
    String? preferredCurrency,
  }) {
    return UserData(
      name: name ?? this.name,
      simulatedScore: simulatedScore ?? this.simulatedScore,
      xpPoints: xpPoints ?? this.xpPoints,
      completedLessons: completedLessons ?? this.completedLessons,
      quizScores: quizScores ?? this.quizScores,
      earnedBadges: earnedBadges ?? this.earnedBadges,
      preferredCurrency: preferredCurrency ?? this.preferredCurrency,
    );
  }
}