// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../cubit/navigation/navigation_cubit.dart' as _i3;
import '../models/destination.dart' as _i4;
import '../services/preferences_service.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $configureDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.NavigationState>(_i3.NavigationState(
    previousRoutes: gh<List<Set<_i4.Destination>>>(),
    currentRoute: gh<Set<_i4.Destination>>(),
  ));
  await gh.singletonAsync<_i5.PreferensesService>(
    () => _i5.PreferensesService.getInstance(),
    preResolve: true,
  );
  return getIt;
}
