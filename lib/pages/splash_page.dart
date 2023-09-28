import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/cubit/navigation/navigation_cubit.dart';
import 'package:nav2_example/cubit/splash_page/splash_page_cubit.dart';
import 'package:nav2_example/models/destination.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SplashPageCubit>(),
      child: BlocListener<SplashPageCubit, SplashPageState>(
        listener: (context, state) {
          final cubit = context.read<NavigationCubit>();
          switch (state.status) {
            case SplashPageStatus.authorized:
              cubit.replaceRoute({Destination.home});
              break;
            case SplashPageStatus.unauthorized:
              cubit.replaceRoute({Destination.login});
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
