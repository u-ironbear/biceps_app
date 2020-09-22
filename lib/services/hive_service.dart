import 'package:biceps_app/models/diary_program.dart';
import 'package:biceps_app/models/program.dart';
import 'package:biceps_app/models/training_day.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class HiveService {
  Future saveProgramToDiary(
      Program program, List<TrainingDay> days, DateTime date) async {
    var programBox = await Hive.openBox<DiaryProgram>('program_box');
    var prefs = await SharedPreferences.getInstance();
    DiaryProgram diaryProgram;

    String _programName = program.name;

    diaryProgram.startDate = date;
    diaryProgram.duration = program.duration;
    diaryProgram.split = program.split;
    diaryProgram.trainingDays = days;
    diaryProgram.trainingDates = [];

    for (int i = 0; i < diaryProgram.duration; i++) {
      switch (diaryProgram.split) {
        case 2:
          {
            diaryProgram.trainingDates.add(date.add(Duration(days: 7 * i)));
            diaryProgram.trainingDates.add(date.add(Duration(days: 4 + 7 * i)));
            break;
          }
        case 3:
          {
            diaryProgram.trainingDates.add(date.add(Duration(days: 7 * i)));
            diaryProgram.trainingDates.add(date.add(Duration(days: 2 + 7 * i)));
            diaryProgram.trainingDates.add(date.add(Duration(days: 4 + 7 * i)));
            break;
          }
        case 4:
          {
            diaryProgram.trainingDates.add(date.add(Duration(days: 7 * i)));
            diaryProgram.trainingDates.add(date.add(Duration(days: 1 + 7 * i)));
            diaryProgram.trainingDates.add(date.add(Duration(days: 3 + 7 * i)));
            diaryProgram.trainingDates.add(date.add(Duration(days: 4 + 7 * i)));
            break;
          }
      }
    }
    programBox.put(_programName, diaryProgram);
    prefs.setString('current', _programName);
  }

  Future fetchProgram(String programName) async {}

  Future addReadings() async {
    var readingsBox = await Hive.openBox('readings_box');
  }

  Future getReadings() async {}

  Future addResults() async {
    var resultsBox = await Hive.openBox('results_box');
  }

  Future getResults() async {}
}
