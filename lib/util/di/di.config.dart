// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i3;

import '../../helpers/network_call_helper/http_network_call_helper_impl.dart'
    as _i8;
import '../../helpers/network_call_helper/network_call_helper.dart' as _i7;
import '../../helpers/persistence/persistence_helper.dart' as _i5;
import '../../helpers/persistence/persistence_helper_imp.dart' as _i6;
import 'di.dart' as _i4;

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
    gh.lazySingleton<_i3.Logger>(() => _i4.LoggerImp());
    gh.singleton<_i5.PersistenceHelper>(() => _i6.PersistenceHelperImpl());
    gh.lazySingleton<_i7.NetworkCallHelper>(
        () => _i8.HttpNetworkCallHelperImpl(logger: gh<_i3.Logger>()));
    return this;
  }
}
