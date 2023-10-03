import 'package:flutter/widgets.dart';
import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/pages/home_page/home_page.dart';

class HomeRoute extends AppRoute {
  static const path = '/home';

  const HomeRoute({required super.args});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
