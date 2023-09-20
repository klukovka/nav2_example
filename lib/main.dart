import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nav2_example/cubit/navigation/navigation_cubit.dart';
import 'package:nav2_example/di/di.dart';
import 'package:nav2_example/di/locator.dart';
import 'package:nav2_example/models/destination.dart';
import 'package:nav2_example/pages/home_page/home_page.dart';
import 'package:nav2_example/pages/login_page.dart';
import 'package:nav2_example/pages/splash_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await configureDependencies();
  runApp(const NavApp());
}

class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => locator<NavigationCubit>(),
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return Navigator(
              onPopPage: (route, result) {
                if (state.previousRoutes.isNotEmpty) {
                  context.read<NavigationCubit>().closePage();
                  return false;
                }
                return true;
              },
              pages: state.currentRoute.expand<Page>((destination) sync* {
                switch (destination) {
                  case Destination.splash:
                    yield const MaterialPage(
                      key: ValueKey(Destination.splash),
                      child: SplashPage(),
                    );
                    break;
                  case Destination.login:
                    yield const MaterialPage(
                      key: ValueKey(Destination.login),
                      child: LoginPage(),
                    );
                    break;
                  case Destination.home:
                  case Destination.posts:
                  case Destination.settings:
                    yield const MaterialPage(
                      key: ValueKey(Destination.home),
                      child: HomePage(),
                    );
                    break;
                }
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
