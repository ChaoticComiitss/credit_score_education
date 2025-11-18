// Create this new file: adapters/manual_user_data_adapter.dart
import 'package:hive/hive.dart';
import '../models/user_data.dart';

class ManualUserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 0;

  @override
  UserData read(BinaryReader reader) {
    return UserData(
      name: reader.readString(),
      simulatedScore: reader.readInt(),
      xpPoints: reader.readInt(),
      completedLessons: (reader.readList() as List).cast<String>(),
      quizScores: (reader.readMap() as Map).cast<String, int>(),
      earnedBadges: (reader.readList() as List).cast<String>(),
      preferredCurrency: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.simulatedScore);
    writer.writeInt(obj.xpPoints);
    writer.writeList(obj.completedLessons);
    writer.writeMap(obj.quizScores);
    writer.writeList(obj.earnedBadges);
    writer.writeString(obj.preferredCurrency);
  }
}