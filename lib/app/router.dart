import 'package:auto_route/auto_route_annotations.dart';
import 'package:biceps_app/ui/views/exercises_view/exercises_view.dart';
import 'package:biceps_app/ui/views/home_view/home_view.dart';
import 'package:biceps_app/ui/views/intro_view/intro_view.dart';
import 'package:biceps_app/ui/views/login_view/login_view.dart';
import 'package:biceps_app/ui/views/signup_view/signup_view.dart';
import 'package:biceps_app/ui/views/startup_view/startup_view.dart';
import 'package:biceps_app/ui/widgets/single_article.dart';
import 'package:biceps_app/ui/widgets/single_exercise.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: StartupView, initial: true),
  MaterialRoute(page: IntroView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignupView),
  MaterialRoute(page: SingleArticle),
  MaterialRoute(page: ExercisesView),
  MaterialRoute(page: SingleExercise),
])
class $Router {}
