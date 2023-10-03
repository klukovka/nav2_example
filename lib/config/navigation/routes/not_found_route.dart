import 'package:flutter/material.dart';
import 'package:nav2_example/config/navigation/app_page.dart';

class NotFoundRoute extends AppRoute {
  const NotFoundRoute({required super.args});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Not Found'),
      ),
    );
  }
}
