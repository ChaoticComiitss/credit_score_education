import 'package:hive/hive.dart';

part 'lesson.g.dart';

@HiveType(typeId: 1)
class Lesson {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final String imageAsset;

  @HiveField(4)
  final int xpReward;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.imageAsset,
    this.xpReward = 10,
  });
}