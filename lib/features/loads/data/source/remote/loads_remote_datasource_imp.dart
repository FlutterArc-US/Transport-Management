////********** START IMPORTS **********////
import 'package:avcons/features/loads/data/entities/load/rest_load.dart';
import 'package:avcons/features/loads/data/source/remote/loads_remote_datasource.dart';
import 'package:avcons/features/loads/domain/usecases/book_load.dart';
import 'package:avcons/features/loads/domain/usecases/get_booked_loads.dart';
import 'package:avcons/features/loads/domain/usecases/get_loads.dart';
import 'package:avcons/helpers/network_call_helper/network_call_helper.dart';
import 'package:avcons/util/consts/api.dart';
import 'package:avcons/util/exceptions/message_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
////********** END IMPORTS **********////

@LazySingleton(as: LoadsRemoteDataSource)
class LoadsRemoteDataSourceImp implements LoadsRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  LoadsRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

////********** START METHODS **********////
  @override
  Future<GetLoadsUsecaseOutput> getLoads(GetLoadsUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.loads,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data =
          List<Map<String, dynamic>>.from(response['loads'] as List<dynamic>);

      final loads = data.map(RestLoadEntity.fromJson).toList();

      return GetLoadsUsecaseOutput(loads: loads);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getLoads: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [BookLoadUsecaseInput] is received to [bookLoad] method as parameter
  /// [BookLoadUsecaseOutput] is returned from [bookLoad] method
  @override
  Future<BookLoadUsecaseOutput> bookLoad(BookLoadUsecaseInput input) async {
    try {
      _logger.i(input.toString());

      final response = await _networkCallHelper.post(
        Apis.bookLoad,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
        {
          "loadId": input.loadId,
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      return BookLoadUsecaseOutput();
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT bookLoad: $e");
      throw SomethingWentWrongException();
    }
  }

  /// [GetBookedLoadsUsecaseInput] is received to [getBookedLoads] method as parameter
  /// [GetBookedLoadsUsecaseOutput] is returned from [getBookedLoads] method
  @override
  Future<GetBookedLoadsUsecaseOutput> getBookedLoads(
      GetBookedLoadsUsecaseInput input) async {
    try {
      _logger.i(input.toString());
      final response = await _networkCallHelper.get(
        Apis.bookedLoads,
        headers: {
          'Authorization': 'Bearer ${input.bearer}',
        },
      );

      _logger.i("Response: $response");

      if (!(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data =
          List<Map<String, dynamic>>.from(response['loads'] as List<dynamic>);

      final loads = data.map(RestLoadEntity.fromJson).toList();

      return GetBookedLoadsUsecaseOutput(loads: loads);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT getBookedLoads: $e");
      throw SomethingWentWrongException();
    }
  }

////********** END METHODS **********////
}
