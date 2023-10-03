import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/login_page/login_page_bloc.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/pages/login_page.dart';

class LoginRoute extends AppRoute {
  static const path = '/login';

  const LoginRoute({required super.args});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<LoginPageBloc>(),
      child: const LoginPage(),
    );
  }
}
