import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/login_page/login_page_bloc.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/bloc/splash_page/splash_page_bloc.dart';
import 'package:nav2_example/config/di/locator.dart';
import 'package:nav2_example/config/navigation/page_config.dart';
import 'package:nav2_example/config/navigation/routes/home_route.dart';
import 'package:nav2_example/config/navigation/routes/login_route.dart';
import 'package:nav2_example/config/navigation/routes/not_found_route.dart';
import 'package:nav2_example/config/navigation/routes/posts_route.dart';
import 'package:nav2_example/config/navigation/routes/settings_route.dart';
import 'package:nav2_example/config/navigation/routes/splash_route.dart';
import 'package:nav2_example/pages/home_page/home_page.dart';
import 'package:nav2_example/pages/login_page.dart';
import 'package:nav2_example/pages/not_found_page.dart';
import 'package:nav2_example/pages/splash_page.dart';

class AppRouterDelegate extends RouterDelegate<PageConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfig> {
  final NavigationBloc _bloc;

  AppRouterDelegate(this._bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Navigator(
          pages: state.pages.expand((element) sync* {
            switch (element.name) {
              case SplashRoute.path:
                yield MaterialPage(
                  key: const ValueKey(SplashRoute.path),
                  child: BlocProvider(
                    create: (context) => locator<SplashPageBloc>()
                      ..add(InitialSplashPageEvent()),
                    child: const SplashPage(),
                  ),
                );
                break;
              case HomeRoute.path:
              case PostsRoute.path:
              case SettingsRoute.path:
                yield const MaterialPage(
                  key: ValueKey(HomeRoute.path),
                  child: HomePage(),
                );
                break;
              case LoginRoute.path:
                yield MaterialPage(
                  key: const ValueKey(LoginRoute.path),
                  child: BlocProvider(
                    create: (context) => locator<LoginPageBloc>(),
                    child: const LoginPage(),
                  ),
                );
                break;
              case NotFoundRoute.path:
                yield const MaterialPage(
                  key: ValueKey(NotFoundRoute.path),
                  child: NotFoundPage(),
                );
                break;
              default:
                break;
            }
          }).toList(),
          key: navigatorKey,
          onPopPage: (route, result) => _onPopPage.call(route, result),
        );
      },
    );
  }

  ///here we handle back buttons
  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (_bloc.state.canPop()) {
      _bloc.add(const ClosePageNavigationEvent());
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfig configuration) async {
    if (configuration.route != '/') {
      _bloc.add(
        OpenPageNavigationEvent(configuration.route, configuration.args),
      );
    }
  }

  ///called by router when it detects it may have changed because of a rebuild
  ///necessary for backward and forward buttons to work properly
  @override
  PageConfig? get currentConfiguration => _bloc.state.last;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
