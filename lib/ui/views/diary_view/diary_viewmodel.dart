import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/services/hive_service.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DiaryViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final HiveService _hiveService = locator<HiveService>();

  EventList<Event> _markedDatesMap = EventList<Event>(events: {});
  EventList<Event> get markedDatesMap => _markedDatesMap;

  Future fetchDiary() async {
    //TODO Также здесь должно быть заполнение eventList
  }
}
