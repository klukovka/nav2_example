import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/config/di/di.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/config/navigation/app_route_information_parser.dart';
import 'package:nav2_example/config/navigation/app_router_delegate.dart';
import 'package:nav2_example/config/navigation/page_config.dart';
import 'package:nav2_example/config/navigation/routes/splash_route.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await configureDependencies();
  runApp(const NavApp());
}

class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<NavigationBloc>(
        param1: [PageConfig(location: SplashRoute.path)],
      ),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          routerDelegate: AppRouterDelegate(context.read<NavigationBloc>()),
          routeInformationParser: AppRouteInformationParser(),
          backButtonDispatcher: RootBackButtonDispatcher(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
