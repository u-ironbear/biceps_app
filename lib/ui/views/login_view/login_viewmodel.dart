import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/services/authentication_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.logInWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(Routes.homeView);
      } else {
        await _dialogService.showDialog(
          title: 'Ошибка входа',
          description:
              'Невозможно войти в данный момент. Пожалуйста, повторите попытку позже',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Ошибка входа',
        description: result,
      );
    }
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(Routes.signupView);
  }
}
