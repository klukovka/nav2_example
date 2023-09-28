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

import '../../api/rest_api_client.dart' as _i6;
import '../../cubit/login_page/login_page_bloc.dart' as _i9;
import '../../cubit/navigation/navigation_bloc.dart' as _i4;
import '../../cubit/post_comments_page/post_comments_page_cubit.dart' as _i12;
import '../../cubit/posts_tab/posts_tab_bloc.dart' as _i11;
import '../../cubit/settings_tab/settings_tab_bloc.dart' as _i7;
import '../../cubit/splash_page/splash_page_bloc.dart' as _i8;
import '../../services/posts_service.dart' as _i10;
import '../../services/preferences_service.dart' as _i5;
import 'modules/api_module.dart' as _i13;

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
  gh.singleton<_i4.NavigationBloc>(_i4.NavigationBloc());
  await gh.singletonAsync<_i5.PreferensesService>(
    () => _i5.PreferensesService.getInstance(),
    preResolve: true,
  );
  gh.lazySingleton<_i6.RestApiClient>(() => apiModule.apiClient(gh<_i3.Dio>()));
  gh.factory<_i7.SettingsTabBloc>(
      () => _i7.SettingsTabBloc(gh<_i5.PreferensesService>()));
  gh.factory<_i8.SplashPageBloc>(
      () => _i8.SplashPageBloc(gh<_i5.PreferensesService>()));
  gh.factory<_i9.LoginPageBloc>(
      () => _i9.LoginPageBloc(gh<_i5.PreferensesService>()));
  gh.lazySingleton<_i10.PostsService>(
      () => _i10.PostsService(gh<_i6.RestApiClient>()));
  gh.factory<_i11.PostsTabBloc>(
      () => _i11.PostsTabBloc(gh<_i10.PostsService>()));
  gh.factoryParam<_i12.PostCommentsPageCubit, int?, dynamic>((
    postId,
    _,
  ) =>
      _i12.PostCommentsPageCubit(
        gh<_i10.PostsService>(),
        postId,
      ));
  return getIt;
}

class _$ApiModule extends _i13.ApiModule {}
