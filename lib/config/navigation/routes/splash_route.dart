import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/splash_page/splash_page_bloc.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/pages/splash_page.dart';

class SplashRoute extends AppRoute {
  static const path = '/splash';

  const SplashRoute({required super.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<SplashPageBloc>()..add(InitialSplashPageEvent()),
      child: const SplashPage(),
    );
  }
}
