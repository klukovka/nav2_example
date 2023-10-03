import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/login_page/login_page_bloc.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/config/navigation/routes/home_route.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginPageBloc, LoginPageState>(
      listener: (context, state) {
        switch (state.status) {
          case LoginPageStatus.success:
            context.read<NavigationBloc>().add(
                  const ReplaceRouteNavigationEvent(HomeRoute.path),
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
                    onPressed: () =>
                        context.read<LoginPageBloc>().add(LoginEvent()),
                    child: const Text('Press to Login'),
                  ),
          ),
        );
      },
    );
  }
}
