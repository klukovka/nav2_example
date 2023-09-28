import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/cubit/login_page/login_page_cubit.dart';
import 'package:nav2_example/cubit/navigation/navigation_bloc.dart';
import 'package:nav2_example/models/destination.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LoginPageCubit>(),
      child: BlocConsumer<LoginPageCubit, LoginPageState>(
        listener: (context, state) {
          switch (state.status) {
            case LoginPageStatus.success:
              context.read<NavigationBloc>().add(
                    const ReplaceRouteNavigationEvent({
                      Destination.home,
                    }),
                  );
              break;
            case LoginPageStatus.error:
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Failed to Login'),
              ));
            default:
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Login')),
            body: Center(
              child: state.status == LoginPageStatus.loading
                  ? const CircularProgressIndicator.adaptive()
                  : ElevatedButton(
                      onPressed: context.read<LoginPageCubit>().login,
                      child: const Text('Press to Login'),
                    ),
            ),
          );
        },
      ),
    );
  }
}
