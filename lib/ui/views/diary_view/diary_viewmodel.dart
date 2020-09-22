import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/services/hive_service.dart';
import 'package:biceps_app/ui/shared/texts.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DiaryViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final HiveService _hiveService = locator<HiveService>();

  String _currentProgram;
  String get currentProgram => _currentProgram;
  String _tasksForToday = noTasksForToday;
  String get tasksForToday => _tasksForToday;
  bool _isTransition = false;
  bool get isTransition => _isTransition;

  EventList<Event> _markedDatesMap = EventList<Event>(events: {});
  EventList<Event> get markedDatesMap => _markedDatesMap;

  Future fetchDiary() async {
    setBusy(true);
    final prefs = await SharedPreferences.getInstance();
    setBusy(false);

    _currentProgram = prefs.getString('current') ?? noProgram;

    if (_currentProgram != noProgram) {
      _hiveService.fetchProgram(_currentProgram);
      _isTransition = true;

      //TODO Также здесь должно быть заполнение EventList
    }
  }

  navigateToTrainingDayView() {
    //TODO Training Day View: Разбить по контейнерам с отдельными упражнениями.
    //TODO И для упражнения сделать ввод рабочего веса и чек – выполнено.
  }

  navigateToProgramManagementView() {
    //TODO Просто найти программу по имени и передать ее.
  }
}
