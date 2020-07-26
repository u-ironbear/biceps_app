import 'package:biceps_app/ui/shared/sizes.dart';
import 'package:biceps_app/ui/views/intro_view/intro_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class IntroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ViewModelBuilder<IntroViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(),
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Добро пожаловать!'),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => IntroViewModel(),
    );
  }
}
