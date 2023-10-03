import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/config/navigation/page_config.dart';
import 'package:nav2_example/config/navigation/routes/home_route.dart';
import 'package:nav2_example/config/navigation/routes/login_route.dart';
import 'package:nav2_example/config/navigation/routes/not_found_route.dart';
import 'package:nav2_example/config/navigation/routes/posts_route.dart';
import 'package:nav2_example/config/navigation/routes/settings_route.dart';
import 'package:nav2_example/config/navigation/routes/splash_route.dart';

AppRoute getRoute(PageConfig config) {
  AppRoute p = _routes[config.route]?.call(config.args) ??
      NotFoundRoute(
        args: config.args,
      );
  return p;
}

Map<String, AppRoute Function(Map<String, dynamic>)> _routes = {
  SplashRoute.path: (args) => SplashRoute(args: args),
  LoginRoute.path: (args) => LoginRoute(args: args),
  HomeRoute.path: (args) => HomeRoute(args: args),
  PostsRoute.path: (args) => PostsRoute(args: args),
  SettingsRoute.path: (args) => SettingsRoute(args: args),
};
