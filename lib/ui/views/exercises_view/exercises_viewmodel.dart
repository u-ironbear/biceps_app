import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/models/exercise.dart';
import 'package:biceps_app/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ExercisesViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  final String muscleGroupModel;

  ExercisesViewModel(this.muscleGroupModel);

  SingleExerciseArguments arguments;

  List<Exercise> _exercises;
  List<Exercise> get exercises => _exercises;

  Future fetchExercises() async {
    setBusy(true);
    var exercisesResult =
        await _firestoreService.getExercises(muscleGroupModel);
    setBusy(false);

    if (exercisesResult is List<Exercise>) {
      _exercises = exercisesResult;
      notifyListeners();
    } else {
      await _dialogService.showDialog(
        title: 'Произошла ошибка',
        description: exercisesResult,
      );
    }
  }

  Future navigateToSingleExercise(index) async {
    arguments = SingleExerciseArguments(exercise: _exercises[index]);
    _navigationService.navigateTo(
      Routes.singleExercise,
      arguments: arguments,
    );
  }
}
