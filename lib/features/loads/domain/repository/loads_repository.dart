////********** START IMPORTS **********////
import 'package:transport_management/features/loads/domain/usecases/book_load.dart';
import 'package:transport_management/features/loads/domain/usecases/get_booked_loads.dart';
import 'package:transport_management/features/loads/domain/usecases/get_loads.dart';
import 'package:transport_management/infrastructure/repository.dart';
////********** END IMPORTS **********////

abstract class LoadsRepository extends Repository {
////********** START METHODS **********////
  /// [GetLoadsUsecaseInput] is received to [getLoads] method as parameter
  /// [GetLoadsUsecaseOutput] is returned from [getLoads] method
  Future<GetLoadsUsecaseOutput> getLoads(GetLoadsUsecaseInput input);

  /// [BookLoadUsecaseInput] is received to [bookLoad] method as parameter
  /// [BookLoadUsecaseOutput] is returned from [bookLoad] method
  Future<BookLoadUsecaseOutput> bookLoad(BookLoadUsecaseInput input);

  /// [GetBookedLoadsUsecaseInput] is received to [getBookedLoads] method as parameter
  /// [GetBookedLoadsUsecaseOutput] is returned from [getBookedLoads] method
  Future<GetBookedLoadsUsecaseOutput> getBookedLoads(
      GetBookedLoadsUsecaseInput input);

////********** END METHODS **********////
}
