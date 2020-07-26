import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:biceps_app/ui/views/login_view/login_viewmodel.dart';
import 'package:biceps_app/ui/widgets/busy_button.dart';
import 'package:biceps_app/ui/widgets/input_field.dart';
import 'package:biceps_app/ui/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Image.asset('assets/images/logo_complete_grey.png'),
                  ),
                  verticalSpaceLarge,
                  InputField(
                    placeholder: 'Email',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Пароль',
                    controller: passwordController,
                    password: true,
                  ),
                  verticalSpaceSmall,
                  TextLink(
                    'Забыли пароль?',
                    onPressed: null,
                    //TODO Implement
                  ),
                  verticalSpaceMedium,
                  BusyButton(
                    title: 'Войти',
                    busy: model.isBusy,
                    onPressed: () {
                      model.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                  verticalSpaceExtraLarge,
                  TextLink(
                    'Нет аккаунта? Так создайте!',
                    onPressed: () {
                      model.navigateToSignUp();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
