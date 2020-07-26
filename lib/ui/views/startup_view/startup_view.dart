import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:biceps_app/ui/views/startup_view/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 130,
                child: Image.asset('assets/images/logo_complete_grey.png'),
              ),
              verticalSpaceLarge,
              SpinKitFadingCircle(
                color: kPrimaryAccent,
                size: 50,
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.handleStartupLogic(),
    );
  }
}
