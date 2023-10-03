import 'package:flutter/material.dart';

typedef TransitionAnimationBuilder = Widget Function(
  BuildContext,
  Animation<double>,
  Animation<double>,
  Widget,
);

///Each Screen must extend this class and provide its functionality
abstract class AppRoute {
  final String name;
  final Map<String, dynamic> args;

  const AppRoute({
    required this.args,
    required this.name,
  });
}
