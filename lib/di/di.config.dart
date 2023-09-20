// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/rest_api_client.dart' as _i6;
import '../cubit/login_page/login_page_cubit.dart' as _i9;
import '../cubit/navigation/navigation_cubit.dart' as _i4;
import '../cubit/settings_tab/settings_page_cubit.dart' as _i7;
import '../cubit/splash_page/splash_page_cubit.dart' as _i8;
import '../services/preferences_service.dart' as _i5;
import 'modules/api_module.dart' as _i10;

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
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i3.Dio>(() => apiModule.dio());
  gh.singleton<_i4.NavigationCubit>(_i4.NavigationCubit());
  await gh.singletonAsync<_i5.PreferensesService>(
    () => _i5.PreferensesService.getInstance(),
    preResolve: true,
  );
  gh.lazySingleton<_i6.RestApiClient>(() => apiModule.apiClient(gh<_i3.Dio>()));
  gh.factory<_i7.SettingsTabCubit>(
      () => _i7.SettingsTabCubit(gh<_i5.PreferensesService>()));
  gh.factory<_i8.SplashPageCubit>(
      () => _i8.SplashPageCubit(gh<_i5.PreferensesService>()));
  gh.factory<_i9.LoginPageCubit>(
      () => _i9.LoginPageCubit(gh<_i5.PreferensesService>()));
  return getIt;
}

class _$ApiModule extends _i10.ApiModule {}
