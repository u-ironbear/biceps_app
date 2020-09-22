import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/sizes.dart';
import 'package:biceps_app/ui/shared/texts.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/intro_2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 30,
            ),
            alignment: Alignment.center,
            width: SizeConfig.screenWidth,
            height: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Добро пожаловать!',
                    style: kMediumHeaderDark,
                  ),
                  verticalSpaceMedium,
                  Container(
                    child: Text(
                      introText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpaceMedium,
                  GestureDetector(
                    child: Container(
                      constraints: BoxConstraints.expand(height: 40),
                      decoration: BoxDecoration(
                        color: kPrimaryAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Зарегистрироваться',
                          style: kButtonTitleTextStyle,
                        ),
                      ),
                    ),
                    onTap: model.navigateToSignup,
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Уже есть аккаунт?'),
                      FlatButton(
                        textColor: kPrimaryAccent,
                        child: Text('Войти'),
                        onPressed: model.navigateToLogin,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => IntroViewModel(),
    );
  }
}
