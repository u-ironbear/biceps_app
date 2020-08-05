import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/models/user.dart';
import 'package:biceps_app/services/authentication_service.dart';
import 'package:biceps_app/services/cloud_storage_service.dart';
import 'package:biceps_app/services/firestore_service.dart';
import 'package:biceps_app/ui/views/articles_view/articles_view.dart';
import 'package:biceps_app/ui/views/calculators_view/calculators_view.dart';
import 'package:biceps_app/ui/views/diary_view/diary_view.dart';
import 'package:biceps_app/ui/views/muscle_groups_view/muscle_groups_view.dart';
import 'package:biceps_app/ui/views/programs_view/programs_view.dart';
import 'package:biceps_app/utils/image_selector.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();

  List<Map<String, Object>> _views = [
    {
      'title': 'Статьи и новости',
      'view': ArticlesView(),
    },
    {
      'title': 'Калькуляторы',
      'view': CalculatorsView(),
    },
    {
      'title': 'Дневник',
      'view': DiaryView(),
    },
    {
      'title': 'Упражнения',
      'view': MuscleGroupsView(),
    },
    {
      'title': 'Программы тренинга',
      'view': ProgramsView(),
    },
  ];
  List<Map<String, Object>> get views => _views;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  String _currentTitle = 'Статьи и новости';
  String get currentTitle => _currentTitle;
  Widget currentView = ArticlesView();

  void setCurrentView(index) {
    _currentIndex = index;
    _currentTitle = _views[_currentIndex]['title'];
    currentView = _views[_currentIndex]['view'];
    notifyListeners();
  }

  User _user;
  User get user => _user;

  void getCurrentUser() {
    _user = _authenticationService.currentUser;
  }

  void logOut() {
    _authenticationService.logOut();
    _navigationService.navigateTo(Routes.introView);
  }

  Future<void> setUserAvatar() async {
    var tempImage = await _imageSelector.selectAvatarImage();
    if (tempImage != null) {
      var storageResult = await _cloudStorageService.uploadImage(
        imageToUpload: tempImage,
        title: 'user',
      );
      user.avatar = storageResult.imageUrl;
      await _firestoreService.updateUser(user);
    }
    notifyListeners();
  }

  void navigateToStatistics() {
    _navigationService.navigateTo(Routes.statisticsView);
  }
}
