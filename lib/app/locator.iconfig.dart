// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:biceps_app/services/authentication_service.dart';
import 'package:biceps_app/services/cloud_storage_service.dart';
import 'package:biceps_app/services/third_party_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:biceps_app/services/firestore_service.dart';
import 'package:biceps_app/services/hive_service.dart';
import 'package:biceps_app/utils/image_selector.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<CloudStorageService>(() => CloudStorageService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<FirestoreService>(() => FirestoreService());
  g.registerLazySingleton<HiveService>(() => HiveService());
  g.registerLazySingleton<ImageSelector>(() => ImageSelector());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
