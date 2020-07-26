import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MuscleGroupsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  List<MuscleGroup> _muscleGroups = [
    MuscleGroup(
      title: 'Грудь',
      image: Image.asset('assets/images/chest.jpg'),
    ),
    MuscleGroup(
      title: 'Спина',
      image: Image.asset('assets/images/back.jpg'),
    ),
    MuscleGroup(
      title: 'Бицепс',
      image: Image.asset('assets/images/biceps.jpg'),
    ),
    MuscleGroup(
      title: 'Трицепс',
      image: Image.asset('assets/images/triceps.jpg'),
    ),
    MuscleGroup(
      title: 'Предплечья',
      image: Image.asset('assets/images/forearms.jpg'),
    ),
    MuscleGroup(
      title: 'Плечи',
      image: Image.asset('assets/images/delts.jpg'),
    ),
    MuscleGroup(
      title: 'Квадрицепс',
      image: Image.asset('assets/images/quads.jpg'),
    ),
    MuscleGroup(
      title: 'Бицепс бедра',
      image: Image.asset('assets/images/hamstrings.jpg'),
    ),
    MuscleGroup(
      title: 'Икры',
      image: Image.asset('assets/images/calves.jpg'),
    ),
    MuscleGroup(
      title: 'Пресс',
      image: Image.asset('assets/images/abs.jpg'),
    ),
  ];
  List<MuscleGroup> get muscleGroups => _muscleGroups;

  ExercisesViewArguments arguments;

  Future navigateToExercisesView(index) async {
    arguments = ExercisesViewArguments(muscleGroup: _muscleGroups[index].title);
    _navigationService.navigateTo(Routes.exercisesView, arguments: arguments);
  }
}

class MuscleGroup {
  final String title;
  final Image image;

  MuscleGroup({
    this.title,
    this.image,
  });
}
