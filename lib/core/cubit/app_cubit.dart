import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:metw_go/core/cubit/app_state.dart';
import 'package:metw_go/core/repo/app_repo.dart';
import 'package:metw_go/core/utils/cache_helper.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final AppRepo _appRepo;
  AppCubit(this._appRepo) : super(AppInitial());

  // void trackDriver() {
  //   LocationService().startTracking(
  //     driverId: CacheHelper.getUserData()?.id.toString() ?? '',
  //     driverName: CacheHelper.getUserData()?.name ?? '',
  //   );
  // }

  Future<void> logout() async {
    emit(ApplogoutLoadingState());
    final result = await _appRepo.logout();
    result.fold((failure) => emit(ApplogoutErrorState(failure.message)), (
      response,
    ) {
      // LocationService().stopTracking(
      //   CacheHelper.getUserData()?.id.toString() ?? '',
      // );
      CacheHelper.clearAll();
      emit(ApplogoutLogoutSuccessState());
    });
  }
}
