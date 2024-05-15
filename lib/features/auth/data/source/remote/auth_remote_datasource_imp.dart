////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:transport_management/features/auth/data/entities/driver/rest_driver.dart';
import 'package:transport_management/features/auth/data/entities/vehicle_model/rest_vehicle_model.dart';
import 'package:transport_management/features/auth/domain/data/auth_remote_datasource.dart';
import 'package:transport_management/features/auth/domain/usecases/current_user.dart';
import 'package:transport_management/features/auth/domain/usecases/delete_user.dart';
import 'package:transport_management/features/auth/domain/usecases/get_vehicle_models.dart';
import 'package:transport_management/features/auth/domain/usecases/initiate_reset_password_verification.dart';
import 'package:transport_management/features/auth/domain/usecases/initiate_verification.dart';
import 'package:transport_management/features/auth/domain/usecases/login_driver.dart';
import 'package:transport_management/features/auth/domain/usecases/register_driver.dart';
import 'package:transport_management/features/auth/domain/usecases/reset_password.dart';
import 'package:transport_management/features/auth/domain/usecases/update_profile.dart';
import 'package:transport_management/features/auth/domain/usecases/verify_otp.dart';
import 'package:transport_management/helpers/network_call_helper/network_call_helper.dart';
import 'package:transport_management/util/consts/api.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
////********** END IMPORTS **********////

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  AuthRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

  /// [InitiateVerificationUsecaseInput] is received to [initiateVerification] method as parameter
  /// [InitiateVerificationUsecaseOutput] is returned from [initiateVerification] method
  @override
  Future<InitiateVerificationUsecaseOutput> initiateVerification(
      InitiateVerificationUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.initiateVerification,
        {
          "phone": input.phone,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return InitiateVerificationUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT initiateVerification: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<CurrentUserUsecaseOutput> currentUser(
      CurrentUserUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.currentUser,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return CurrentUserUsecaseOutput(
          driver: RestDriverEntity.fromJson(response['message']));
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT currentUser: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<LoginDriverUsecaseOutput> login(LoginDriverUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.loginDriver,
        {
          "password": input.password,
          "phone": input.phone,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final token = response["token"] as String;

      return LoginDriverUsecaseOutput(token: token);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT login: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<RegisterDriverUsecaseOutput> register(
      RegisterDriverUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.registerDriver,
        {
          "email": input.email,
          "fullName": input.fullName,
          "password": input.password,
          "verificationToken": input.verificationToken,
          "typeId": input.typeId,
          "phone": input.phone,
          "vehicleId": input.vehicleId,
          "vehicleLicenseNo": input.vehicleLicenseNo,
          "drivingLicenseNo": input.drivingLicenseNo,
          "fleetId": input.fleetId,
          "countryCode": input.countryCode,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final token = response["token"] as String;

      return RegisterDriverUsecaseOutput(token: token);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT register: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [VerifyOtpUsecaseInput] is received to [verifyOtp] method as parameter
  /// [VerifyOtpUsecaseOutput] is returned from [verifyOtp] method
  @override
  Future<VerifyOtpUsecaseOutput> verifyOtp(VerifyOtpUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.verifyOtp,
        {
          "phone": input.phone,
          "otp": input.otp,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final token = response["verificationToken"] as String;

      return VerifyOtpUsecaseOutput(verificationToken: token);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT verifyOtp: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<ResetPasswordUsecaseOutput> resetPassword(
      ResetPasswordUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.resetPassword,
        {
          "verificationToken": input.verificationToken,
          "phone": input.phone,
          "password": input.password,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return ResetPasswordUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT resetPassword: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<DeleteUserUsecaseOutput> deleteUser(
      DeleteUserUsecaseInput input) async {
    try {
      _logger.i(input.toString());

      final response = await _networkCallHelper.post(
        Apis.deleteUser,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
        {},
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return DeleteUserUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT deleteUser: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetVehicleModelsUsecaseInput] is received to [getVehicleModels] method as parameter
  /// [GetVehicleModelsUsecaseOutput] is returned from [getVehicleModels] method
  @override
  Future<GetVehicleModelsUsecaseOutput> getVehicleModels(
      GetVehicleModelsUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.vehicleModels,
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data = List<Map<String, dynamic>>.from(
          response['vehicles'] as List<dynamic>);

      final vehicleModels = data.map(RestVehicleModelEntity.fromJson).toList();

      return GetVehicleModelsUsecaseOutput(vehicles: vehicleModels);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getVehicleModels: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [InitiateResetPasswordVerificationUsecaseInput] is received to [resetPasswordInitiateVerification] method as parameter
  /// [InitiateResetPasswordVerificationUsecaseOutput] is returned from [resetPasswordInitiateVerification] method
  @override
  Future<InitiateResetPasswordVerificationUsecaseOutput>
      resetPasswordInitiateVerification(
          InitiateResetPasswordVerificationUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.post(
        Apis.resetPasswordInitiateVerification,
        {
          "phone": input.phone,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return InitiateResetPasswordVerificationUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger
          .e("SOMETHING WENT WRONG AT resetPasswordInitiateVerification: $e");
      throw SomethingWentWrongException();
    }
  }

  @override
  Future<UpdateProfileUsecaseOutput> updateProfile(
      UpdateProfileUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final filePaths = input.img != null ? [input.img!] : null;

      final response = await _networkCallHelper.multipart(
        Apis.updateProfile,
        filePaths: filePaths,
        filesParam: 'img',
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
        body: {
          "phone": input.phone,
          "email": input.email,
          "password": input.password,
          "fullName": input.fullName,
          "verificationToken": input.verificationToken,
          "countryCode": input.countryCode,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return UpdateProfileUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT updateProfile: $e");
      throw SomethingWentWrongException();
    }
  }

////********** END METHODS **********////
}
