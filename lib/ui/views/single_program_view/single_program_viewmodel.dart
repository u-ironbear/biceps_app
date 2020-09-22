import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/models/program.dart';
import 'package:biceps_app/models/training_day.dart';
import 'package:biceps_app/services/firestore_service.dart';
import 'package:biceps_app/services/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SingleProgramViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final HiveService _hiveService = locator<HiveService>();

  final Program programModel;

  SingleProgramViewModel(this.programModel);

  List<TrainingDay> _trainingDays;
  List<TrainingDay> get trainingDays => _trainingDays;

  ProgramDetailsArguments arguments;

  Future fetchTrainingDays() async {
    setBusy(true);
    var trainingDaysResult =
        await _firestoreService.getTrainingDays(programModel.code);
    setBusy(false);

    if (trainingDaysResult is List<TrainingDay>) {
      _trainingDays = trainingDaysResult;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: 'Произошла ошибка',
        description: trainingDaysResult,
      );
    }
  }

  Future navigateToProgramDetails() async {
    arguments = ProgramDetailsArguments(
      name: programModel.name,
      trainingDays: _trainingDays,
    );
    _navigationService.navigateTo(
      Routes.programDetails,
      arguments: arguments,
    );
  }

  Future sendProgramToDiary(DateTime date) async {
    setBusy(true);
    var daysModel = await _firestoreService.getTrainingDays(programModel.code);
    _hiveService.saveProgramToDiary(programModel, daysModel, date);
    setBusy(false);
    _navigationService.navigateTo(Routes.homeView);
  }
}
