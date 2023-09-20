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

import '../cubit/login_page/login_page_cubit.dart' as _i6;
import '../cubit/navigation/navigation_cubit.dart' as _i3;
import '../cubit/splash_page/splash_page_cubit.dart' as _i5;
import '../services/preferences_service.dart' as _i4;

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
  gh.singleton<_i3.NavigationCubit>(_i3.NavigationCubit());
  await gh.singletonAsync<_i4.PreferensesService>(
    () => _i4.PreferensesService.getInstance(),
    preResolve: true,
  );
  gh.factory<_i5.SplashPageCubit>(
      () => _i5.SplashPageCubit(gh<_i4.PreferensesService>()));
  gh.factory<_i6.LoginPageCubit>(
      () => _i6.LoginPageCubit(gh<_i4.PreferensesService>()));
  return getIt;
}
