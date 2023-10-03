import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/config/navigation/page_config.dart';
import 'package:nav2_example/config/navigation/routes/not_found_route.dart';

AppRoute getEPage(PageConfig config) {
  AppRoute p = _routes[config.route]?.call(config.args) ??
      NotFoundRoute(
        args: config.args,
      );
  return p;
}

Map<String, AppRoute Function(Map<String, dynamic>)> _routes = {};
