import 'package:flutter/widgets.dart';
import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/pages/home_page/home_page.dart';

class PostsRoute extends AppRoute {
  static const path = '/posts';

  const PostsRoute({required super.args});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
