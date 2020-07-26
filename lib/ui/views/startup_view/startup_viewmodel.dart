import 'package:biceps_app/app/locator.dart';
import 'package:biceps_app/app/router.gr.dart';
import 'package:biceps_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartupLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();
    await Future.delayed(const Duration(seconds: 3));

    if (hasLoggedInUser) {
      _navigationService.navigateTo(Routes.homeView);
    } else {
      _navigationService.navigateTo(Routes.introView);
    }
  }
}
