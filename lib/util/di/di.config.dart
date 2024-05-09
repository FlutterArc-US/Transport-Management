// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;

import '../../features/auth/data/repository/auth_repository_imp.dart' as _i26;
import '../../features/auth/data/source/local/auth_local_datasource_imp.dart'
    as _i11;
import '../../features/auth/data/source/remote/auth_remote_datasource_imp.dart'
    as _i22;
import '../../features/auth/domain/data/auth_local_datasource.dart' as _i10;
import '../../features/auth/domain/data/auth_remote_datasource.dart' as _i21;
import '../../features/auth/domain/repository/auth_repository.dart' as _i25;
import '../../features/auth/domain/usecases/current_user.dart' as _i47;
import '../../features/auth/domain/usecases/delete_auth.dart' as _i37;
import '../../features/auth/domain/usecases/delete_user.dart' as _i38;
import '../../features/auth/domain/usecases/get_auth.dart' as _i46;
import '../../features/auth/domain/usecases/get_vehicle_models.dart' as _i43;
import '../../features/auth/domain/usecases/initiate_reset_password_verification.dart'
    as _i42;
import '../../features/auth/domain/usecases/initiate_verification.dart' as _i44;
import '../../features/auth/domain/usecases/login_driver.dart' as _i36;
import '../../features/auth/domain/usecases/register_driver.dart' as _i45;
import '../../features/auth/domain/usecases/reset_password.dart' as _i40;
import '../../features/auth/domain/usecases/save_auth.dart' as _i41;
import '../../features/auth/domain/usecases/update_profile.dart' as _i35;
import '../../features/auth/domain/usecases/verify_otp.dart' as _i39;
import '../../features/image_picker/domain/usecases/pick_camera_image_usecase.dart'
    as _i19;
import '../../features/image_picker/domain/usecases/pick_gallery_image_usecase.dart'
    as _i18;
import '../../features/image_picker/domain/usecases/pick_multi_images_usecase.dart'
    as _i20;
import '../../features/image_picker/domain/usecases/request_camera_permission.dart'
    as _i4;
import '../../features/image_picker/domain/usecases/request_storage_permission.dart'
    as _i3;
import '../../features/loads/data/source/remote/loads_remote_datasource.dart'
    as _i16;
import '../../features/loads/data/source/remote/loads_remote_datasource_imp.dart'
    as _i17;
import '../../features/loads/domain/repository/loads_repository.dart' as _i29;
import '../../features/loads/domain/repository/loads_repository_imp.dart'
    as _i30;
import '../../features/loads/domain/usecases/book_load.dart' as _i48;
import '../../features/loads/domain/usecases/get_booked_loads.dart' as _i50;
import '../../features/loads/domain/usecases/get_loads.dart' as _i49;
import '../../features/onboarding/data/source/local/onboarding_local_datasource.dart'
    as _i12;
import '../../features/onboarding/data/source/local/onboarding_local_datasource_imp.dart'
    as _i13;
import '../../features/onboarding/domain/repository/onboarding_repository.dart'
    as _i27;
import '../../features/onboarding/domain/repository/onboarding_repository_imp.dart'
    as _i28;
import '../../features/onboarding/domain/usecases/is_onboard_seen.dart' as _i33;
import '../../features/onboarding/domain/usecases/set_onboard_seen.dart'
    as _i34;
import '../../features/withdrawal/data/repository/withdrawal_repository_imp.dart'
    as _i32;
import '../../features/withdrawal/data/source/remote/mock_withdrawal_remote_datasource_imp.dart'
    as _i24;
import '../../features/withdrawal/domain/data/withdrawal_remote_datasource.dart'
    as _i23;
import '../../features/withdrawal/domain/repository/withdrawal_repository.dart'
    as _i31;
import '../../features/withdrawal/domain/usecases/create_withdrawal_request.dart'
    as _i51;
import '../../features/withdrawal/domain/usecases/get_withdrawal_requests.dart'
    as _i52;
import '../../helpers/image_picker/image_picker.dart' as _i5;
import '../../helpers/network_call_helper/http_network_call_helper_impl.dart'
    as _i15;
import '../../helpers/network_call_helper/network_call_helper.dart' as _i14;
import '../../helpers/persistence/persistence_helper.dart' as _i8;
import '../../helpers/persistence/persistence_helper_imp.dart' as _i9;
import 'di.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.RequestStoragePermissionUsecase>(
        () => _i3.RequestStoragePermissionUsecase());
    gh.lazySingleton<_i4.RequestCameraPermissionUsecase>(
        () => _i4.RequestCameraPermissionUsecase());
    gh.lazySingleton<_i5.ImagePickerHelper>(
        () => _i5.ImagePickerImagePickerHelper());
    gh.lazySingleton<_i6.Logger>(() => _i7.LoggerImp());
    gh.singleton<_i8.PersistenceHelper>(() => _i9.PersistenceHelperImpl());
    gh.lazySingleton<_i10.AuthLocalDataSource>(
        () => _i11.AuthLocalDataSourceImp(
              logger: gh<_i6.Logger>(),
              persistenceHelper: gh<_i8.PersistenceHelper>(),
            ));
    gh.lazySingleton<_i12.OnboardingLocalDataSource>(
        () => _i13.OnboardingLocalDataSourceImp(
              logger: gh<_i6.Logger>(),
              persistenceHelper: gh<_i8.PersistenceHelper>(),
            ));
    gh.lazySingleton<_i14.NetworkCallHelper>(
        () => _i15.HttpNetworkCallHelperImpl(logger: gh<_i6.Logger>()));
    gh.lazySingleton<_i16.LoadsRemoteDataSource>(
        () => _i17.LoadsRemoteDataSourceImp(
              logger: gh<_i6.Logger>(),
              networkCallHelper: gh<_i14.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i18.PickGalleryImageUsecase>(
        () => _i18.PickGalleryImageUsecase(image: gh<_i5.ImagePickerHelper>()));
    gh.lazySingleton<_i19.PickCameraImageUsecase>(
        () => _i19.PickCameraImageUsecase(image: gh<_i5.ImagePickerHelper>()));
    gh.lazySingleton<_i20.PickMultiGalleryImagesUsecase>(() =>
        _i20.PickMultiGalleryImagesUsecase(image: gh<_i5.ImagePickerHelper>()));
    gh.lazySingleton<_i21.AuthRemoteDataSource>(
        () => _i22.AuthRemoteDataSourceImp(
              logger: gh<_i6.Logger>(),
              networkCallHelper: gh<_i14.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i23.WithdrawalRemoteDataSource>(
        () => _i24.WithdrawalRemoteDataSourceImp(
              logger: gh<_i6.Logger>(),
              networkCallHelper: gh<_i14.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i25.AuthRepository>(() => _i26.AuthRepositoryImp(
          authRemoteDataSource: gh<_i21.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i10.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i27.OnboardingRepository>(() =>
        _i28.OnboardingRepositoryImp(
            onboardingLocalDataSource: gh<_i12.OnboardingLocalDataSource>()));
    gh.lazySingleton<_i29.LoadsRepository>(() => _i30.LoadsRepositoryImp(
        loadsRemoteDataSource: gh<_i16.LoadsRemoteDataSource>()));
    gh.lazySingleton<_i31.WithdrawalRepository>(() =>
        _i32.WithdrawalRepositoryImp(
            withdrawalRemoteDataSource: gh<_i23.WithdrawalRemoteDataSource>()));
    gh.lazySingleton<_i33.IsOnboardSeenUsecase>(() => _i33.IsOnboardSeenUsecase(
        onboardingRepository: gh<_i27.OnboardingRepository>()));
    gh.lazySingleton<_i34.SetOnboardSeenUsecase>(() =>
        _i34.SetOnboardSeenUsecase(
            onboardingRepository: gh<_i27.OnboardingRepository>()));
    gh.lazySingleton<_i35.UpdateProfileUsecase>(() =>
        _i35.UpdateProfileUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i36.LoginDriverUsecase>(() =>
        _i36.LoginDriverUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i37.DeleteAuthUsecase>(() =>
        _i37.DeleteAuthUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i38.DeleteUserUsecase>(() =>
        _i38.DeleteUserUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i39.VerifyOtpUsecase>(
        () => _i39.VerifyOtpUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i40.ResetPasswordUsecase>(() =>
        _i40.ResetPasswordUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i41.SaveAuthUsecase>(
        () => _i41.SaveAuthUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i42.InitiateResetPasswordVerificationUsecase>(() =>
        _i42.InitiateResetPasswordVerificationUsecase(
            authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i43.GetVehicleModelsUsecase>(() =>
        _i43.GetVehicleModelsUsecase(
            authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i44.InitiateVerificationUsecase>(() =>
        _i44.InitiateVerificationUsecase(
            authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i45.RegisterDriverUsecase>(() =>
        _i45.RegisterDriverUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i46.GetAuthUsecase>(
        () => _i46.GetAuthUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i47.CurrentUserUsecase>(() =>
        _i47.CurrentUserUsecase(authRepository: gh<_i25.AuthRepository>()));
    gh.lazySingleton<_i48.BookLoadUsecase>(() =>
        _i48.BookLoadUsecase(loadsRepository: gh<_i29.LoadsRepository>()));
    gh.lazySingleton<_i49.GetLoadsUsecase>(() =>
        _i49.GetLoadsUsecase(loadsRepository: gh<_i29.LoadsRepository>()));
    gh.lazySingleton<_i50.GetBookedLoadsUsecase>(() =>
        _i50.GetBookedLoadsUsecase(
            loadsRepository: gh<_i29.LoadsRepository>()));
    gh.lazySingleton<_i51.CreateWithdrawalRequestUsecase>(() =>
        _i51.CreateWithdrawalRequestUsecase(
            withdrawalRepository: gh<_i31.WithdrawalRepository>()));
    gh.lazySingleton<_i52.GetWithdrawalRequestsUsecase>(() =>
        _i52.GetWithdrawalRequestsUsecase(
            withdrawalRepository: gh<_i31.WithdrawalRepository>()));
    return this;
  }
}
