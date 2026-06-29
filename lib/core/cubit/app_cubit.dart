import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/repo/app_repo.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
import 'package:metw_go/features/home/presentation/services/tracking_location_service.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final AppRepo _appRepo;
  AppCubit(this._appRepo) : super(AppInitial());

  Locale currentLocale = const Locale('ar');
  bool isDarkMode = false;

  void changeLanguage(Locale locale) {
    currentLocale = locale;
    emit(ChangeLanguageState());
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    emit(ChangeThemeState());
  }

  // void trackDriver() {
  //   TrackingLocationService().startTracking(
  //     driverId: '9', //CacheHelper.getUserData()?.id.toString() ?? '',
  //     // driverName: "محمد احمد", //CacheHelper.getUserData()?.name ?? '',
  //   );
  // }

  Future<void> logout() async {
    emit(ApplogoutLoadingState());
    final result = await _appRepo.logout();
    result.fold((failure) => emit(ApplogoutErrorState(failure.message)), (
      response,
    ) {
      TrackingLocationService().stopTracking(
        CacheHelper.getUserData()?.id.toString() ?? '',
      );
      CacheHelper.clearAll();
      emit(ApplogoutLogoutSuccessState());
    });
  }
}
