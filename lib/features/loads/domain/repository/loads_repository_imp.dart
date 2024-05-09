////********** START IMPORTS **********////
import 'package:transport_management/features/loads/data/source/remote/loads_remote_datasource.dart';
import 'package:transport_management/features/loads/domain/repository/loads_repository.dart';
import 'package:transport_management/features/loads/domain/usecases/book_load.dart';
import 'package:transport_management/features/loads/domain/usecases/get_booked_loads.dart';
import 'package:transport_management/features/loads/domain/usecases/get_loads.dart';
import 'package:injectable/injectable.dart';
////********** END IMPORTS **********////

@LazySingleton(as: LoadsRepository)
class LoadsRepositoryImp implements LoadsRepository {
////********** START VARIABLES **********////
  final LoadsRemoteDataSource _loadsRemoteDataSource;
////********** END VARIABLES **********////

  LoadsRepositoryImp({
////********** START RECEIVE VALUES **********////
    required LoadsRemoteDataSource loadsRemoteDataSource,
////********** END RECEIVE VALUES **********////
  }) :
////********** START SET VALUES **********////
        _loadsRemoteDataSource = loadsRemoteDataSource
////********** END SET VALUES **********////
  ;

////********** START METHODS **********////
  /// [GetLoadsUsecaseInput] is received to [getLoads] method as parameter
  /// [GetLoadsUsecaseOutput] is returned from [getLoads] method
  @override
  Future<GetLoadsUsecaseOutput> getLoads(GetLoadsUsecaseInput input) async {
    return _loadsRemoteDataSource.getLoads(input);
  }

  /// [BookLoadUsecaseInput] is received to [bookLoad] method as parameter
  /// [BookLoadUsecaseOutput] is returned from [bookLoad] method
  @override
  Future<BookLoadUsecaseOutput> bookLoad(BookLoadUsecaseInput input) async {
    return _loadsRemoteDataSource.bookLoad(input);
  }

  /// [GetBookedLoadsUsecaseInput] is received to [getBookedLoads] method as parameter
  /// [GetBookedLoadsUsecaseOutput] is returned from [getBookedLoads] method
  @override
  Future<GetBookedLoadsUsecaseOutput> getBookedLoads(
      GetBookedLoadsUsecaseInput input) async {
    return _loadsRemoteDataSource.getBookedLoads(input);
  }

////********** END METHODS **********////
}
