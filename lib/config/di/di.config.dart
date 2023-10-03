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

import '../../api/rest_api_client.dart' as _i7;
import '../../bloc/login_page/login_page_bloc.dart' as _i10;
import '../../bloc/navigation/navigation_bloc.dart' as _i4;
import '../../bloc/post_comments_page/post_comments_page_bloc.dart' as _i13;
import '../../bloc/posts_tab/posts_tab_bloc.dart' as _i12;
import '../../bloc/settings_tab/settings_tab_bloc.dart' as _i8;
import '../../bloc/splash_page/splash_page_bloc.dart' as _i9;
import '../../services/posts_service.dart' as _i11;
import '../../services/preferences_service.dart' as _i6;
import '../navigation/page_config.dart' as _i5;
import 'modules/api_module.dart' as _i14;

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
  gh.factoryParam<_i4.NavigationBloc, List<_i5.PageConfig>, dynamic>((
    initialPages,
    _,
  ) =>
      _i4.NavigationBloc(initialPages));
  await gh.singletonAsync<_i6.PreferensesService>(
    () => _i6.PreferensesService.getInstance(),
    preResolve: true,
  );
  gh.lazySingleton<_i7.RestApiClient>(() => apiModule.apiClient(gh<_i3.Dio>()));
  gh.factory<_i8.SettingsTabBloc>(
      () => _i8.SettingsTabBloc(gh<_i6.PreferensesService>()));
  gh.factory<_i9.SplashPageBloc>(
      () => _i9.SplashPageBloc(gh<_i6.PreferensesService>()));
  gh.factory<_i10.LoginPageBloc>(
      () => _i10.LoginPageBloc(gh<_i6.PreferensesService>()));
  gh.lazySingleton<_i11.PostsService>(
      () => _i11.PostsService(gh<_i7.RestApiClient>()));
  gh.factory<_i12.PostsTabBloc>(
      () => _i12.PostsTabBloc(gh<_i11.PostsService>()));
  gh.factory<_i13.PostCommentsPageBloc>(
      () => _i13.PostCommentsPageBloc(gh<_i11.PostsService>()));
  return getIt;
}

class _$ApiModule extends _i14.ApiModule {}
