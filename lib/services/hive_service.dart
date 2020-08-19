import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveService {
  Future createDiary() async {
    var diary = await Hive.openBox('diary');
  }

  Future addProgramToDiary() async {}

  Future updateDiary() async {}

  Future getDiary() async {}

  Future addMeasurements() async {}

  Future getMeasurements() async {}

  Future addResults() async {}

  Future getResults() async {}
}
