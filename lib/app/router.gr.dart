// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:biceps_app/ui/views/startup_view/startup_view.dart';
import 'package:biceps_app/ui/views/intro_view/intro_view.dart';
import 'package:biceps_app/ui/views/home_view/home_view.dart';
import 'package:biceps_app/ui/views/login_view/login_view.dart';
import 'package:biceps_app/ui/views/signup_view/signup_view.dart';
import 'package:biceps_app/ui/widgets/single_article.dart';
import 'package:biceps_app/models/article.dart';
import 'package:biceps_app/ui/views/exercises_view/exercises_view.dart';
import 'package:biceps_app/ui/widgets/single_exercise.dart';
import 'package:biceps_app/models/exercise.dart';
import 'package:biceps_app/ui/views/statistics_view/statistics_view.dart';
import 'package:biceps_app/ui/views/single_program_view/single_program_view.dart';
import 'package:biceps_app/models/program.dart';
import 'package:biceps_app/ui/widgets/program_details.dart';
import 'package:biceps_app/models/training_day.dart';
import 'package:biceps_app/ui/views/training_day_view/training_day_view.dart';

class Routes {
  static const String startupView = '/';
  static const String introView = '/intro-view';
  static const String homeView = '/home-view';
  static const String loginView = '/login-view';
  static const String signupView = '/signup-view';
  static const String singleArticle = '/single-article';
  static const String exercisesView = '/exercises-view';
  static const String singleExercise = '/single-exercise';
  static const String statisticsView = '/statistics-view';
  static const String singleProgramView = '/single-program-view';
  static const String programDetails = '/program-details';
  static const String trainingDayView = '/training-day-view';
  static const all = <String>{
    startupView,
    introView,
    homeView,
    loginView,
    signupView,
    singleArticle,
    exercisesView,
    singleExercise,
    statisticsView,
    singleProgramView,
    programDetails,
    trainingDayView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.introView, page: IntroView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.signupView, page: SignupView),
    RouteDef(Routes.singleArticle, page: SingleArticle),
    RouteDef(Routes.exercisesView, page: ExercisesView),
    RouteDef(Routes.singleExercise, page: SingleExercise),
    RouteDef(Routes.statisticsView, page: StatisticsView),
    RouteDef(Routes.singleProgramView, page: SingleProgramView),
    RouteDef(Routes.programDetails, page: ProgramDetails),
    RouteDef(Routes.trainingDayView, page: TrainingDayView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupView(),
        settings: data,
      );
    },
    IntroView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IntroView(),
        settings: data,
      );
    },
    HomeView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    LoginView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    SignupView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
      );
    },
    SingleArticle: (RouteData data) {
      var args = data.getArgs<SingleArticleArguments>(
          orElse: () => SingleArticleArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            SingleArticle(key: args.key, article: args.article),
        settings: data,
      );
    },
    ExercisesView: (RouteData data) {
      var args = data.getArgs<ExercisesViewArguments>(
          orElse: () => ExercisesViewArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            ExercisesView(key: args.key, muscleGroup: args.muscleGroup),
        settings: data,
      );
    },
    SingleExercise: (RouteData data) {
      var args = data.getArgs<SingleExerciseArguments>(
          orElse: () => SingleExerciseArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            SingleExercise(key: args.key, exercise: args.exercise),
        settings: data,
      );
    },
    StatisticsView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StatisticsView(),
        settings: data,
      );
    },
    SingleProgramView: (RouteData data) {
      var args = data.getArgs<SingleProgramViewArguments>(
          orElse: () => SingleProgramViewArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            SingleProgramView(key: args.key, program: args.program),
        settings: data,
      );
    },
    ProgramDetails: (RouteData data) {
      var args = data.getArgs<ProgramDetailsArguments>(
          orElse: () => ProgramDetailsArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProgramDetails(
          key: args.key,
          name: args.name,
          trainingDays: args.trainingDays,
        ),
        settings: data,
      );
    },
    TrainingDayView: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TrainingDayView(),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//SingleArticle arguments holder class
class SingleArticleArguments {
  final Key key;
  final Article article;
  SingleArticleArguments({this.key, this.article});
}

//ExercisesView arguments holder class
class ExercisesViewArguments {
  final Key key;
  final String muscleGroup;
  ExercisesViewArguments({this.key, this.muscleGroup});
}

//SingleExercise arguments holder class
class SingleExerciseArguments {
  final Key key;
  final Exercise exercise;
  SingleExerciseArguments({this.key, this.exercise});
}

//SingleProgramView arguments holder class
class SingleProgramViewArguments {
  final Key key;
  final Program program;
  SingleProgramViewArguments({this.key, this.program});
}

//ProgramDetails arguments holder class
class ProgramDetailsArguments {
  final Key key;
  final String name;
  final List<TrainingDay> trainingDays;
  ProgramDetailsArguments({this.key, this.name, this.trainingDays});
}
