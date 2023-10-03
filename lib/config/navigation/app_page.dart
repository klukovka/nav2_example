import 'package:flutter/material.dart';

typedef TransitionAnimationBuilder = Widget Function(
  BuildContext,
  Animation<double>,
  Animation<double>,
  Widget,
);

///Each Screen must extend this class and provide its functionality
abstract class AppRoute extends Page {
  final Map<String, dynamic> args;
  final int transitionDuration, reverseTransitionDuration; //milliseconds

  ///Give each individual screen the option to define a special entry animation
  final TransitionAnimationBuilder? animationBuilder;

  const AppRoute({
    required this.args,
    this.transitionDuration = 400,
    this.reverseTransitionDuration = 400,
    this.animationBuilder,
  });

  ///build page content by overridng this function
  Widget build(BuildContext context);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(builder: build);
    // return PageRouteBuilder<dynamic>(
    //   transitionDuration: Duration(milliseconds: transitionDuration),
    //   reverseTransitionDuration:
    //       Duration(milliseconds: reverseTransitionDuration),
    //   transitionsBuilder: (
    //     context,
    //     animation,
    //     secondaryAnimation,
    //     child,
    //   ) =>
    //       animationBuilder?.call(
    //         context,
    //         animation,
    //         secondaryAnimation,
    //         child,
    //       ) ??
    //       _defaultAnimationBuilder(
    //         context,
    //         animation,
    //         secondaryAnimation,
    //         child,
    //       ),
    //   pageBuilder: (
    //     BuildContext context,
    //     Animation<double> animation,
    //     Animation<double> animation2,
    //   ) =>
    //       build(context),
    // );
  }
}
