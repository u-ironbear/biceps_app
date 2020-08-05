import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/services/authentication_service.dart';
import 'package:biceps_app/ui/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  String _selectedGender = 'Пол';
  String get selectedGender => _selectedGender;

  void setSelectedGender(dynamic gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  Future signUp({
    @required email,
    @required password,
    @required name,
    @required age,
    @required trackRecord,
  }) async {
    setBusy(true);

    if (_selectedGender == 'Пол') {
      _selectedGender = 'Мужской';
    }

    int _numTrackRecord = int.parse(trackRecord);

    if (_numTrackRecord <= 2) {
      trackRecord = 'начальный';
    } else if (_numTrackRecord <= 5) {
      trackRecord = 'средний';
    } else if (_numTrackRecord <= 10) {
      trackRecord = 'высокий';
    } else {
      trackRecord = 'профи';
    }

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      name: name,
      gender: _selectedGender,
      age: age,
      trackRecord: trackRecord,
      avatar: placeholderToken,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(Routes.homeView);
      } else {
        _dialogService.showDialog(
            title: 'Ошибка авторизации',
            description: 'Пожалуйста, заполните все поля');
      }
    } else {
      _dialogService.showDialog(
        title: 'Ошибка авторизации',
        description: result,
      );
    }
  }
}
