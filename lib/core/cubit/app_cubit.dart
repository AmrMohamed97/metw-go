import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/repo/app_repo.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
import 'package:metw_go/features/home/presentation/services/firebase_rtdb_helper.dart';
import 'package:metw_go/features/home/presentation/services/tracking_location_service.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final AppRepo _appRepo;
  AppCubit(this._appRepo) : super(AppInitial()) {
    // realTime(9);
  }

  String status = 'offline';
  StreamSubscription<DatabaseEvent>? _statusSubscription;
  final FirebaseDatabase _database = FirebaseRtdbHelper.database;

  Future<void> realTime(int driverId) async {
    // Listen to the specific driver's status
    final statusRef = _database.ref('drivers/$driverId/status');
    emit(HomeStatusLoading());
    try {
      _statusSubscription?.cancel();
      _statusSubscription = statusRef.onValue.listen((event) {
        if (event.snapshot.value != null) {
          status = event.snapshot.value.toString();
          emit(HomeStatusChanged(status));
        }
      });
    } catch (e) {
      emit(HomeStatusError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _statusSubscription?.cancel();
    return super.close();
  }

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
