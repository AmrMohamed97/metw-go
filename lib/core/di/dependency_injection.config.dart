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
import 'package:metw_go/features/documents/presentation/manager/documents_cubit.dart'
    as _i91;
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_cubit.dart'
    as _i203;
import 'package:metw_go/features/forget_password/data/data_source/forget_password_data_source.dart'
    as _i904;
import 'package:metw_go/features/forget_password/data/repo/forget_password_repo.dart'
    as _i778;
import 'package:metw_go/features/forget_password/data/repo/forget_password_repo_implement.dart'
    as _i718;
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_cubit.dart'
    as _i37;
import 'package:metw_go/features/home/presentation/manager/home_cubit.dart'
    as _i171;
import 'package:metw_go/features/login/data/data_source/login_data_source.dart'
    as _i101;
import 'package:metw_go/features/login/data/repo/login_repo.dart' as _i540;
import 'package:metw_go/features/login/data/repo/login_repo_impl.dart' as _i770;
import 'package:metw_go/features/login/presentation/manager/login_cubit.dart'
    as _i563;
import 'package:metw_go/features/notification/presentation/manager/notification_cubit.dart'
    as _i364;
import 'package:metw_go/features/order_details/data/data_source/order_details_data_source.dart'
    as _i304;
import 'package:metw_go/features/order_details/data/repositories/order_details_repository.dart'
    as _i603;
import 'package:metw_go/features/order_details/data/repositories/order_details_repository_impl.dart'
    as _i94;
import 'package:metw_go/features/order_details/presentation/cubit/order_details_cubit.dart'
    as _i571;
import 'package:metw_go/features/orders/data/data_source/orders_data_source.dart'
    as _i533;
import 'package:metw_go/features/orders/data/repo/orders_repo.dart' as _i480;
import 'package:metw_go/features/orders/data/repo/orders_repo_impl.dart'
    as _i975;
import 'package:metw_go/features/orders/presentation/manager/orders_cubit.dart'
    as _i364;
import 'package:metw_go/features/otp/data/data_source/otp_data_source.dart'
    as _i50;
import 'package:metw_go/features/otp/data/repo/otp_repo.dart' as _i72;
import 'package:metw_go/features/otp/data/repo/otp_repo_implement.dart'
    as _i794;
import 'package:metw_go/features/otp/presentation/manager/otp_cubit.dart'
    as _i859;
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_cubit.dart'
    as _i87;
import 'package:metw_go/features/profile/data/data_source/profile_data_source.dart'
    as _i587;
import 'package:metw_go/features/profile/data/repo/profile_repo.dart' as _i869;
import 'package:metw_go/features/profile/data/repo/profile_repo_impl.dart'
    as _i731;
import 'package:metw_go/features/profile/presentation/manager/profile_cubit.dart'
    as _i197;
import 'package:metw_go/features/register/data/data_source/register_data_source.dart'
    as _i961;
import 'package:metw_go/features/register/data/repo/register_repo.dart'
    as _i617;
import 'package:metw_go/features/register/data/repo/register_repo_implement.dart'
    as _i142;
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart'
    as _i1006;
import 'package:metw_go/features/register_steps/data/data_source/first_step_data_source.dart'
    as _i655;
import 'package:metw_go/features/register_steps/data/data_source/fourth_step_data_source.dart'
    as _i701;
import 'package:metw_go/features/register_steps/data/data_source/second_step_data_source.dart'
    as _i497;
import 'package:metw_go/features/register_steps/data/data_source/third_step_data_source.dart'
    as _i837;
import 'package:metw_go/features/register_steps/data/repo/first_step_repo.dart'
    as _i305;
import 'package:metw_go/features/register_steps/data/repo/first_step_repo_impl.dart'
    as _i29;
import 'package:metw_go/features/register_steps/data/repo/fourth_step_repo.dart'
    as _i858;
import 'package:metw_go/features/register_steps/data/repo/fourth_step_repo_impl.dart'
    as _i605;
import 'package:metw_go/features/register_steps/data/repo/second_step_repo.dart'
    as _i393;
import 'package:metw_go/features/register_steps/data/repo/second_step_repo_impl.dart'
    as _i211;
import 'package:metw_go/features/register_steps/data/repo/third_step_repo.dart'
    as _i319;
import 'package:metw_go/features/register_steps/data/repo/third_step_repo_impl.dart'
    as _i220;
import 'package:metw_go/features/register_steps/presentation/manager/first_step_cubit/first_step_cubit.dart'
    as _i212;
import 'package:metw_go/features/register_steps/presentation/manager/fourth_step_cubit/fourth_step_cubit.dart'
    as _i449;
import 'package:metw_go/features/register_steps/presentation/manager/second_step_cubit.dart/second_step_cubit.dart'
    as _i333;
import 'package:metw_go/features/register_steps/presentation/manager/third_step_cubit.dart/third_step_cubit.dart'
    as _i273;
import 'package:metw_go/features/service_areas/presentation/manager/service_areas_cubit.dart'
    as _i661;
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
    gh.factory<_i91.DocumentsCubit>(() => _i91.DocumentsCubit());
    gh.factory<_i203.DelegateInfoCubit>(() => _i203.DelegateInfoCubit());
    gh.factory<_i171.HomeCubit>(() => _i171.HomeCubit());
    gh.factory<_i364.NotificationCubit>(() => _i364.NotificationCubit());
    gh.factory<_i87.PersonalInfoCubit>(() => _i87.PersonalInfoCubit());
    gh.factory<_i661.ServiceAreasCubit>(() => _i661.ServiceAreasCubit());
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
    gh.factory<_i904.ForgetPasswordDataSource>(
      () => _i904.ForgetPasswordDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i101.LoginDataSource>(
      () => _i101.LoginDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i304.OrderDetailsDataSource>(
      () => _i304.OrderDetailsDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i533.OrdersDataSource>(
      () => _i533.OrdersDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i50.OtpDataSource>(() => _i50.OtpDataSource(gh<_i361.Dio>()));
    gh.factory<_i587.ProfileDataSource>(
      () => _i587.ProfileDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i961.RegisterDataSource>(
      () => _i961.RegisterDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i655.FirstStepDataSource>(
      () => _i655.FirstStepDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i701.FourthStepDataSource>(
      () => _i701.FourthStepDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i497.SecondStepDataSource>(
      () => _i497.SecondStepDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i837.ThirdStepDataSource>(
      () => _i837.ThirdStepDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i540.LoginRepo>(
      () => _i770.LoginRepoImpl(loginDataSource: gh<_i101.LoginDataSource>()),
    );
    gh.factory<_i305.FirstStepRepo>(
      () => _i29.FirstStepRepoImpl(gh<_i655.FirstStepDataSource>()),
    );
    gh.factory<_i444.AppRepo>(
      () => _i837.AppRepoImpl(gh<_i863.AppDataSource>()),
    );
    gh.factory<_i393.SecondStepRepo>(
      () => _i211.SecondStepRepoImpl(gh<_i497.SecondStepDataSource>()),
    );
    gh.factory<_i212.FirstStepCubit>(
      () => _i212.FirstStepCubit(gh<_i305.FirstStepRepo>()),
    );
    gh.factory<_i858.FourthStepRepo>(
      () => _i605.FourthStepRepoImpl(gh<_i701.FourthStepDataSource>()),
    );
    gh.factory<_i778.ForgetPasswordRepo>(
      () => _i718.ForgetPasswordRepoImplement(
        gh<_i904.ForgetPasswordDataSource>(),
      ),
    );
    gh.factory<_i563.LoginCubit>(() => _i563.LoginCubit(gh<_i540.LoginRepo>()));
    gh.factory<_i617.RegisterRepo>(
      () => _i142.RegisterRepoImplement(gh<_i961.RegisterDataSource>()),
    );
    gh.factory<_i1006.RegisterCubit>(
      () => _i1006.RegisterCubit(gh<_i617.RegisterRepo>()),
    );
    gh.factory<_i72.OtpRepo>(
      () => _i794.OtpRepoImplement(gh<_i50.OtpDataSource>()),
    );
    gh.factory<_i869.ProfileRepo>(
      () => _i731.ProfileRepoImpl(
        profileDataSource: gh<_i587.ProfileDataSource>(),
      ),
    );
    gh.factory<_i405.AppCubit>(() => _i405.AppCubit(gh<_i444.AppRepo>()));
    gh.factory<_i37.ForgetPasswordCubit>(
      () => _i37.ForgetPasswordCubit(gh<_i778.ForgetPasswordRepo>()),
    );
    gh.factory<_i480.OrdersRepo>(
      () =>
          _i975.OrdersRepoImpl(ordersDataSource: gh<_i533.OrdersDataSource>()),
    );
    gh.factory<_i603.OrderDetailsRepository>(
      () => _i94.OrderDetailsRepositoryImpl(gh<_i304.OrderDetailsDataSource>()),
    );
    gh.factory<_i319.ThirdStepRepo>(
      () => _i220.ThirdStepRepoImpl(gh<_i837.ThirdStepDataSource>()),
    );
    gh.factory<_i333.SecondStepCubit>(
      () => _i333.SecondStepCubit(gh<_i393.SecondStepRepo>()),
    );
    gh.factory<_i364.OrdersCubit>(
      () => _i364.OrdersCubit(gh<_i480.OrdersRepo>()),
    );
    gh.factory<_i449.FourthStepCubit>(
      () => _i449.FourthStepCubit(gh<_i858.FourthStepRepo>()),
    );
    gh.factory<_i571.OrderDetailsCubit>(
      () => _i571.OrderDetailsCubit(gh<_i603.OrderDetailsRepository>()),
    );
    gh.factory<_i859.OtpCubit>(() => _i859.OtpCubit(gh<_i72.OtpRepo>()));
    gh.factory<_i197.ProfileCubit>(
      () => _i197.ProfileCubit(profileRepo: gh<_i869.ProfileRepo>()),
    );
    gh.factory<_i273.ThirdStepCubit>(
      () => _i273.ThirdStepCubit(gh<_i319.ThirdStepRepo>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i939.RegisterModule {}

class _$DioFactory extends _i611.DioFactory {}
