// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:metw_go/core/cubit/app_cubit.dart' as _i405;
import 'package:metw_go/core/data_source/app_data_source.dart' as _i863;
import 'package:metw_go/core/di/dependency_injection.dart' as _i939;
import 'package:metw_go/core/network/dio/dio_factory.dart' as _i611;
import 'package:metw_go/core/network/dio/dio_interceptor.dart' as _i402;
import 'package:metw_go/core/repo/app_repo.dart' as _i444;
import 'package:metw_go/core/repo/app_repo_impl.dart' as _i837;
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_cubit.dart'
    as _i203;
import 'package:metw_go/features/home/presentation/manager/home_cubit.dart'
    as _i171;
import 'package:metw_go/features/login/presentation/manager/login_cubit.dart'
    as _i563;
import 'package:metw_go/features/orders/presentation/manager/orders_cubit.dart'
    as _i364;
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_cubit.dart'
    as _i87;
import 'package:metw_go/features/profile/presentation/manager/profile_cubit.dart'
    as _i197;
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart'
    as _i1006;
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_cubit.dart'
    as _i192;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final dioFactory = _$DioFactory();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i203.DelegateInfoCubit>(() => _i203.DelegateInfoCubit());
    gh.factory<_i171.HomeCubit>(() => _i171.HomeCubit());
    gh.factory<_i563.LoginCubit>(() => _i563.LoginCubit());
    gh.factory<_i364.OrdersCubit>(() => _i364.OrdersCubit());
    gh.factory<_i87.PersonalInfoCubit>(() => _i87.PersonalInfoCubit());
    gh.factory<_i197.ProfileCubit>(() => _i197.ProfileCubit());
    gh.factory<_i1006.RegisterCubit>(() => _i1006.RegisterCubit());
    gh.factory<_i192.VehicleCubit>(() => _i192.VehicleCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i361.LogInterceptor>(() => registerModule.logInterceptor);
    gh.factory<_i402.CustomInterceptor>(
      () => _i402.CustomInterceptor(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.factory<_i361.Dio>(
      () => dioFactory.getDio(gh<_i402.CustomInterceptor>()),
    );
    gh.factory<_i863.AppDataSource>(() => _i863.AppDataSource(gh<_i361.Dio>()));
    gh.factory<_i444.AppRepo>(
      () => _i837.AppRepoImpl(gh<_i863.AppDataSource>()),
    );
    gh.factory<_i405.AppCubit>(() => _i405.AppCubit(gh<_i444.AppRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i939.RegisterModule {}

class _$DioFactory extends _i611.DioFactory {}
