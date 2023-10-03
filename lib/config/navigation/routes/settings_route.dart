import 'package:flutter/widgets.dart';
import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/pages/home_page/home_page.dart';

class SettingsRoute extends AppRoute {
  static const path = '/settings';

  const SettingsRoute({required super.args});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
