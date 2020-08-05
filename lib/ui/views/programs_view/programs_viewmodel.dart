import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/models/program.dart';
import 'package:biceps_app/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProgramsViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  List<Program> _programs;
  List<Program> get programs => _programs;

  SingleProgramViewArguments arguments;

  Future fetchPrograms() async {
    setBusy(true);
    var programsResult = await _firestoreService.getPrograms();
    setBusy(false);

    if (programsResult is List<Program>) {
      _programs = programsResult;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: 'Произошла ошибка',
        description: programsResult,
      );
    }
  }

  Future navigateToSingleProgram(index) async {
    arguments = SingleProgramViewArguments(program: _programs[index]);
    _navigationService.navigateTo(
      Routes.singleProgramView,
      arguments: arguments,
    );
  }
}
