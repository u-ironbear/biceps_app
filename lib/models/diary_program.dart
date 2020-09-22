import 'package:biceps_app/models/training_day.dart';
import 'package:hive/hive.dart';

part 'diary_program.g.dart';

@HiveType(typeId: 0)
class DiaryProgram extends HiveObject {
  @HiveField(0)
  DateTime startDate;
  @HiveField(1)
  int duration;
  @HiveField(2)
  int split;
  @HiveField(3)
  List<DateTime> trainingDates;
  @HiveField(4)
  List<TrainingDay> trainingDays;

  DiaryProgram({
    this.startDate,
    this.duration,
    this.split,
    this.trainingDates,
    this.trainingDays,
  });
}
