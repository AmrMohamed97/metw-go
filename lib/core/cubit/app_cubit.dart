import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/const/app_const.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/repo/app_repo.dart';
import 'package:metw_go/core/utils/cache_helper.dart';
import 'package:metw_go/features/home/presentation/services/firebase_rtdb_helper.dart';
// import 'package:metw_go/features/homer/presentation/services/tracking_location_service.dart';

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
      // throw Exception('kkkkk');
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

  Locale currentLocale = Locale(
    CacheHelper.getData(key: AppConstant.lang) ??
        ui.PlatformDispatcher.instance.locale.languageCode,
  );
  bool isDarkMode =
      CacheHelper.getData(key: AppConstant.kTheme) ??
      (ui.PlatformDispatcher.instance.platformBrightness == ui.Brightness.dark);

  void changeLanguage(Locale locale) {
    currentLocale = locale;
    CacheHelper.saveData(key: AppConstant.lang, value: locale.languageCode);
    emit(ChangeLanguageState());
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    CacheHelper.saveData(key: AppConstant.kTheme, value: value);
    emit(ChangeThemeState());
  }

  Future<void> logout() async {
    emit(ApplogoutLoadingState());
    final result = await _appRepo.logout();
    result.fold((failure) => emit(ApplogoutErrorState(failure.message)), (
      response,
    ) {
      // TrackingLocationService().stopTracking(
      //   CacheHelper.getUserData()?.id.toString() ?? '',
      // );
      CacheHelper.clearAll();
      emit(ApplogoutLogoutSuccessState());
    });
  }

  Future<void> acceptStartOrder({required String orderId}) async {
    emit(AcceptStartOrderLoadingState());
    final result = await _appRepo.acceptStartOrder(orderId: orderId);
    result.fold(
      (failure) => emit(AcceptStartOrderErrorState(failure.message)),
      (response) => emit(AcceptStartOrderSuccessState(response)),
    );
  }

  Future<void> arriveAtPickupOrder({required String orderId}) async {
    emit(ArriveAtPickupOrderLoadingState());
    final result = await _appRepo.arriveAtPickupOrder(orderId: orderId);
    result.fold(
      (failure) => emit(ArriveAtPickupOrderErrorState(failure.message)),
      (response) => emit(ArriveAtPickupOrderSuccessState(response)),
    );
  }

  Future<void> confirmPickupOrder({
    required String orderId,
    File? proofPhoto,
    String? signature,
    String? packageCountVerified,
    String? packageConditionVerified,
    String? merchantSignatureObtained,
  }) async {
    emit(ConfirmPickupOrderLoadingState());
    final result = await _appRepo.confirmPickupOrder(
      orderId: orderId,
      proofPhoto: proofPhoto,
      signature: signature,
      packageCountVerified: packageCountVerified,
      packageConditionVerified: packageConditionVerified,
      merchantSignatureObtained: merchantSignatureObtained,
    );
    result.fold(
      (failure) => emit(ConfirmPickupOrderErrorState(failure.message)),
      (response) => emit(ConfirmPickupOrderSuccessState(response)),
    );
  }

  Future<void> arriveAtDropoffOrder({required String orderId}) async {
    emit(ArriveAtDropoffOrderLoadingState());
    final result = await _appRepo.arriveAtDropoffOrder(orderId: orderId);
    result.fold(
      (failure) => emit(ArriveAtDropoffOrderErrorState(failure.message)),
      (response) => emit(ArriveAtDropoffOrderSuccessState(response)),
    );
  }

  Future<void> completeDeliveryOrder({
    required String orderId,
    File? proofPhoto,
    String? signature,
    String? recipientOtp,
    String? collectedAmount,
    String? deliveryNote,
    String? recipientName,
  }) async {
    emit(CompleteDeliveryOrderLoadingState());
    final result = await _appRepo.completeDeliveryOrder(
      orderId: orderId,
      proofPhoto: proofPhoto,
      signature: signature,
      recipientOtp: recipientOtp,
      collectedAmount: collectedAmount,
      deliveryNote: deliveryNote,
      recipientName: recipientName,
    );
    result.fold(
      (failure) => emit(CompleteDeliveryOrderErrorState(failure.message)),
      (response) => emit(CompleteDeliveryOrderSuccessState(response)),
    );
  }
}
