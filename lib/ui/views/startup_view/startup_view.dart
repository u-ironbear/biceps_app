import 'package:biceps_app/ui/views/startup_view/startup_viewmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class StartupView extends StatelessWidget {
  //TODO Implement animation
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/intro_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SpinKitThreeBounce(
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.handleStartupLogic(),
    );
  }
}
