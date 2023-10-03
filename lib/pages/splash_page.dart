import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/bloc/splash_page/splash_page_bloc.dart';
import 'package:nav2_example/config/navigation/routes/home_route.dart';
import 'package:nav2_example/config/navigation/routes/login_route.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashPageBloc, SplashPageState>(
      listener: (context, state) {
        final cubit = context.read<NavigationBloc>();
        switch (state.status) {
          case SplashPageStatus.authorized:
            cubit.add(const ReplaceRouteNavigationEvent(HomeRoute.path));
            break;
          case SplashPageStatus.unauthorized:
            cubit.add(const ReplaceRouteNavigationEvent(LoginRoute.path));
            break;
          default:
            break;
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
