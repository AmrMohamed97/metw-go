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
import 'package:metw_go/features/contact_us/data/data_source/contact_us_data_source.dart'
    as _i359;
import 'package:metw_go/features/contact_us/data/repo/contact_us_repo.dart'
    as _i312;
import 'package:metw_go/features/contact_us/data/repo/contact_us_repo_impl.dart'
    as _i14;
import 'package:metw_go/features/contact_us/presentation/manager/contact_us_cubit.dart'
    as _i874;
import 'package:metw_go/features/documents/data/data_source/documents_data_source.dart'
    as _i818;
import 'package:metw_go/features/documents/data/repo/documents_repo.dart'
    as _i642;
import 'package:metw_go/features/documents/data/repo/documents_repo_impl.dart'
    as _i547;
import 'package:metw_go/features/documents/presentation/manager/documents_cubit.dart'
    as _i91;
import 'package:metw_go/features/driver_info/data/data_source/delegate_info_data_source.dart'
    as _i237;
import 'package:metw_go/features/driver_info/data/repo/delegate_info_repo.dart'
    as _i848;
import 'package:metw_go/features/driver_info/data/repo/delegate_info_repo_impl.dart'
    as _i308;
import 'package:metw_go/features/driver_info/presentation/manager/delegate_info_cubit.dart'
    as _i203;
import 'package:metw_go/features/faq/data/data_source/faq_data_source.dart'
    as _i201;
import 'package:metw_go/features/faq/data/repo/faq_repo.dart' as _i522;
import 'package:metw_go/features/faq/data/repo/faq_repo_impl.dart' as _i679;
import 'package:metw_go/features/faq/presentation/manager/faq_cubit.dart'
    as _i129;
import 'package:metw_go/features/forget_password/data/data_source/forget_password_data_source.dart'
    as _i904;
import 'package:metw_go/features/forget_password/data/repo/forget_password_repo.dart'
    as _i778;
import 'package:metw_go/features/forget_password/data/repo/forget_password_repo_implement.dart'
    as _i718;
import 'package:metw_go/features/forget_password/presentation/manager/forget_password_cubit.dart'
    as _i37;
import 'package:metw_go/features/home/data/data_source/home_data_source.dart'
    as _i551;
import 'package:metw_go/features/home/data/repo/home_repo.dart' as _i576;
import 'package:metw_go/features/home/data/repo/home_repo_impl.dart' as _i591;
import 'package:metw_go/features/home/presentation/manager/home_cubit.dart'
    as _i171;
import 'package:metw_go/features/login/data/data_source/login_data_source.dart'
    as _i101;
import 'package:metw_go/features/login/data/repo/login_repo.dart' as _i540;
import 'package:metw_go/features/login/data/repo/login_repo_impl.dart' as _i770;
import 'package:metw_go/features/login/presentation/manager/login_cubit.dart'
    as _i563;
import 'package:metw_go/features/main_view/manager/main_view_cubit.dart'
    as _i419;
import 'package:metw_go/features/notification/data/data_source/notification_data_source.dart'
    as _i283;
import 'package:metw_go/features/notification/data/repo/notification_repo.dart'
    as _i1001;
import 'package:metw_go/features/notification/data/repo/notification_repo_impl.dart'
    as _i314;
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
import 'package:metw_go/features/personal_info/data/data_source/personal_info_data_source.dart'
    as _i971;
import 'package:metw_go/features/personal_info/data/repo/personal_info_repo.dart'
    as _i169;
import 'package:metw_go/features/personal_info/data/repo/personal_info_repo_impl.dart'
    as _i74;
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_cubit.dart'
    as _i87;
import 'package:metw_go/features/privacy/data/data_source/privacy_data_source.dart'
    as _i160;
import 'package:metw_go/features/privacy/data/repo/privacy_repo.dart' as _i195;
import 'package:metw_go/features/privacy/data/repo/privacy_repo_impl.dart'
    as _i914;
import 'package:metw_go/features/privacy/presentation/manager/privacy_cubit.dart'
    as _i963;
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
import 'package:metw_go/features/service_areas/data/data_source/service_areas_data_source.dart'
    as _i139;
import 'package:metw_go/features/service_areas/data/repo/service_areas_repo.dart'
    as _i967;
import 'package:metw_go/features/service_areas/data/repo/service_areas_repo_impl.dart'
    as _i508;
import 'package:metw_go/features/service_areas/presentation/manager/service_areas_cubit.dart'
    as _i661;
import 'package:metw_go/features/vehicle_data/data/data_source/vehicle_data_source.dart'
    as _i773;
import 'package:metw_go/features/vehicle_data/data/repo/vehicle_repo.dart'
    as _i451;
import 'package:metw_go/features/vehicle_data/data/repo/vehicle_repo_impl.dart'
    as _i916;
import 'package:metw_go/features/vehicle_data/presentation/manager/vehicle_cubit.dart'
    as _i192;
import 'package:metw_go/features/wallet/data/data_source/wallet_data_source.dart'
    as _i361;
import 'package:metw_go/features/wallet/data/repo/wallet_repo.dart' as _i141;
import 'package:metw_go/features/wallet/data/repo/wallet_repo_impl.dart'
    as _i1002;
import 'package:metw_go/features/wallet/presentation/manager/wallet_cubit.dart'
    as _i661;
import 'package:metw_go/features/wallet_transaction/data/data_source/wallet_operation_data_source.dart'
    as _i997;
import 'package:metw_go/features/wallet_transaction/data/repo/wallet_operation_repo.dart'
    as _i717;
import 'package:metw_go/features/wallet_transaction/data/repo/wallet_operation_repo_impl.dart'
    as _i863;
import 'package:metw_go/features/wallet_transaction/presentation/manager/wallet_operation_cubit.dart'
    as _i286;
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
    gh.factory<_i419.MainViewCubit>(() => _i419.MainViewCubit());
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
    gh.factory<_i359.ContactUsDataSource>(
      () => _i359.ContactUsDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i818.DocumentsDataSource>(
      () => _i818.DocumentsDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i237.DelegateInfoDataSource>(
      () => _i237.DelegateInfoDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i201.FaqDataSource>(() => _i201.FaqDataSource(gh<_i361.Dio>()));
    gh.factory<_i904.ForgetPasswordDataSource>(
      () => _i904.ForgetPasswordDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i551.HomeDataSource>(
      () => _i551.HomeDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i101.LoginDataSource>(
      () => _i101.LoginDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i283.NotificationDataSource>(
      () => _i283.NotificationDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i304.OrderDetailsDataSource>(
      () => _i304.OrderDetailsDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i533.OrdersDataSource>(
      () => _i533.OrdersDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i50.OtpDataSource>(() => _i50.OtpDataSource(gh<_i361.Dio>()));
    gh.factory<_i971.PersonalInfoDataSource>(
      () => _i971.PersonalInfoDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i160.PrivacyDataSource>(
      () => _i160.PrivacyDataSource(gh<_i361.Dio>()),
    );
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
    gh.factory<_i139.ServiceAreasDataSource>(
      () => _i139.ServiceAreasDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i773.VehicleDataSource>(
      () => _i773.VehicleDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i361.WalletDataSource>(
      () => _i361.WalletDataSource(gh<_i361.Dio>()),
    );
    gh.factory<_i997.WalletOperationDataSource>(
      () => _i997.WalletOperationDataSource(gh<_i361.Dio>()),
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
    gh.factory<_i522.FaqRepo>(
      () => _i679.FaqRepoImpl(dataSource: gh<_i201.FaqDataSource>()),
    );
    gh.factory<_i169.PersonalInfoRepo>(
      () => _i74.PersonalInfoRepoImpl(
        personalInfoDataSource: gh<_i971.PersonalInfoDataSource>(),
      ),
    );
    gh.factory<_i393.SecondStepRepo>(
      () => _i211.SecondStepRepoImpl(gh<_i497.SecondStepDataSource>()),
    );
    gh.factory<_i212.FirstStepCubit>(
      () => _i212.FirstStepCubit(gh<_i305.FirstStepRepo>()),
    );
    gh.factory<_i451.VehicleRepo>(
      () => _i916.VehicleRepoImpl(
        vehicleDataSource: gh<_i773.VehicleDataSource>(),
      ),
    );
    gh.factory<_i312.ContactUsRepo>(
      () => _i14.ContactUsRepoImpl(dataSource: gh<_i359.ContactUsDataSource>()),
    );
    gh.factory<_i858.FourthStepRepo>(
      () => _i605.FourthStepRepoImpl(gh<_i701.FourthStepDataSource>()),
    );
    gh.factory<_i192.VehicleCubit>(
      () => _i192.VehicleCubit(vehicleRepo: gh<_i451.VehicleRepo>()),
    );
    gh.factory<_i778.ForgetPasswordRepo>(
      () => _i718.ForgetPasswordRepoImplement(
        gh<_i904.ForgetPasswordDataSource>(),
      ),
    );
    gh.factory<_i563.LoginCubit>(() => _i563.LoginCubit(gh<_i540.LoginRepo>()));
    gh.factory<_i195.PrivacyRepo>(
      () => _i914.PrivacyRepoImpl(dataSource: gh<_i160.PrivacyDataSource>()),
    );
    gh.factory<_i617.RegisterRepo>(
      () => _i142.RegisterRepoImplement(gh<_i961.RegisterDataSource>()),
    );
    gh.factory<_i1006.RegisterCubit>(
      () => _i1006.RegisterCubit(gh<_i617.RegisterRepo>()),
    );
    gh.factory<_i967.ServiceAreasRepo>(
      () => _i508.ServiceAreasRepoImpl(
        serviceAreasDataSource: gh<_i139.ServiceAreasDataSource>(),
      ),
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
    gh.factory<_i642.DocumentsRepo>(
      () => _i547.DocumentsRepoImpl(
        documentsDataSource: gh<_i818.DocumentsDataSource>(),
      ),
    );
    gh.factory<_i848.DelegateInfoRepo>(
      () => _i308.DelegateInfoRepoImpl(
        delegateInfoDataSource: gh<_i237.DelegateInfoDataSource>(),
      ),
    );
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
    gh.factory<_i576.HomeRepo>(
      () => _i591.HomeRepoImpl(homeDataSource: gh<_i551.HomeDataSource>()),
    );
    gh.factory<_i141.WalletRepo>(
      () =>
          _i1002.WalletRepoImpl(walletDataSource: gh<_i361.WalletDataSource>()),
    );
    gh.factory<_i717.WalletOperationRepo>(
      () => _i863.WalletOperationRepoImpl(
        dataSource: gh<_i997.WalletOperationDataSource>(),
      ),
    );
    gh.factory<_i319.ThirdStepRepo>(
      () => _i220.ThirdStepRepoImpl(gh<_i837.ThirdStepDataSource>()),
    );
    gh.factory<_i87.PersonalInfoCubit>(
      () => _i87.PersonalInfoCubit(
        personalInfoRepo: gh<_i169.PersonalInfoRepo>(),
      ),
    );
    gh.factory<_i333.SecondStepCubit>(
      () => _i333.SecondStepCubit(gh<_i393.SecondStepRepo>()),
    );
    gh.factory<_i963.PrivacyCubit>(
      () => _i963.PrivacyCubit(gh<_i195.PrivacyRepo>()),
    );
    gh.factory<_i1001.NotificationRepo>(
      () => _i314.NotificationRepoImpl(
        dataSource: gh<_i283.NotificationDataSource>(),
      ),
    );
    gh.factory<_i203.DelegateInfoCubit>(
      () => _i203.DelegateInfoCubit(
        delegateInfoRepo: gh<_i848.DelegateInfoRepo>(),
      ),
    );
    gh.factory<_i129.FaqCubit>(() => _i129.FaqCubit(gh<_i522.FaqRepo>()));
    gh.factory<_i364.OrdersCubit>(
      () => _i364.OrdersCubit(gh<_i480.OrdersRepo>()),
    );
    gh.factory<_i286.WalletOperationCubit>(
      () => _i286.WalletOperationCubit(gh<_i717.WalletOperationRepo>()),
    );
    gh.factory<_i874.ContactUsCubit>(
      () => _i874.ContactUsCubit(gh<_i312.ContactUsRepo>()),
    );
    gh.factory<_i449.FourthStepCubit>(
      () => _i449.FourthStepCubit(gh<_i858.FourthStepRepo>()),
    );
    gh.factory<_i571.OrderDetailsCubit>(
      () => _i571.OrderDetailsCubit(gh<_i603.OrderDetailsRepository>()),
    );
    gh.factory<_i364.NotificationCubit>(
      () => _i364.NotificationCubit(gh<_i1001.NotificationRepo>()),
    );
    gh.factory<_i859.OtpCubit>(() => _i859.OtpCubit(gh<_i72.OtpRepo>()));
    gh.factory<_i661.ServiceAreasCubit>(
      () => _i661.ServiceAreasCubit(gh<_i967.ServiceAreasRepo>()),
    );
    gh.factory<_i171.HomeCubit>(
      () => _i171.HomeCubit(repo: gh<_i576.HomeRepo>()),
    );
    gh.factory<_i197.ProfileCubit>(
      () => _i197.ProfileCubit(profileRepo: gh<_i869.ProfileRepo>()),
    );
    gh.factory<_i91.DocumentsCubit>(
      () => _i91.DocumentsCubit(gh<_i642.DocumentsRepo>()),
    );
    gh.factory<_i661.WalletCubit>(
      () => _i661.WalletCubit(walletRepo: gh<_i141.WalletRepo>()),
    );
    gh.factory<_i273.ThirdStepCubit>(
      () => _i273.ThirdStepCubit(gh<_i319.ThirdStepRepo>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i939.RegisterModule {}

class _$DioFactory extends _i611.DioFactory {}
