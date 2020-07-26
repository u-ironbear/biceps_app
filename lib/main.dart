import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/ui/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Biceps Fitness',
      theme: ThemeData(
        primaryColor: kPrimaryDarkGrey,
        accentColor: kPrimaryAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: Router(),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
