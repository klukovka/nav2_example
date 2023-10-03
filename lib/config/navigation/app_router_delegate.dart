import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/config/navigation/page_config.dart';

class AppRouterDelegate extends RouterDelegate<PageConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfig> {
  final NavigationBloc _bloc;

  AppRouterDelegate(this._bloc);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Navigator(
          pages: state.pages,
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
