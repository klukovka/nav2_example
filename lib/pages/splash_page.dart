import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/bloc/splash_page/splash_page_bloc.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/models/destination.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<SplashPageBloc>()..add(InitialSplashPageEvent()),
      child: BlocListener<SplashPageBloc, SplashPageState>(
        listener: (context, state) {
          final cubit = context.read<NavigationBloc>();
          switch (state.status) {
            case SplashPageStatus.authorized:
              cubit.add(const ReplaceRouteNavigationEvent({Destination.home}));
              break;
            case SplashPageStatus.unauthorized:
              cubit.add(const ReplaceRouteNavigationEvent({Destination.login}));
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
      ),
    );
  }
}
