import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_data.dart';

class DatabaseService {
  static Box<UserData> get userBox => Hive.box<UserData>('userData');

  static UserData getCurrentUser() {
    if (userBox.isEmpty) {
      final newUser = UserData(
        name: 'New User',
        simulatedScore: 720,
        xpPoints: 0,
        completedLessons: [],
        quizScores: {},
        earnedBadges: [],
        preferredCurrency: 'USD', // Add this missing parameter
      );
      userBox.add(newUser);
      return newUser;
    }
    return userBox.getAt(0)!;
  }

  static Future<void> updateUser(UserData user) async {
    if (userBox.isNotEmpty) {
      await userBox.putAt(0, user);
    }
  }

  static Future<void> addCompletedLesson(String lessonId) async {
    final user = getCurrentUser();
    if (!user.completedLessons.contains(lessonId)) {
      final updatedUser = user.copyWith(
        completedLessons: [...user.completedLessons, lessonId],
        xpPoints: user.xpPoints + 10,
      );
      await updateUser(updatedUser);
    }
  }

  static Future<void> updateQuizScore(String quizId, int score) async {
    final user = getCurrentUser();
    final updatedScores = Map<String, int>.from(user.quizScores);
    updatedScores[quizId] = score;

    final updatedUser = user.copyWith(
      quizScores: updatedScores,
      xpPoints: user.xpPoints + score,
    );
    await updateUser(updatedUser);
  }

  static Future<void> addBadge(String badgeId) async {
    final user = getCurrentUser();
    if (!user.earnedBadges.contains(badgeId)) {
      final updatedUser = user.copyWith(
        earnedBadges: [...user.earnedBadges, badgeId],
        xpPoints: user.xpPoints + 25,
      );
      await updateUser(updatedUser);
    }
  }
}