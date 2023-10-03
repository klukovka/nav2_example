import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/bloc/navigation/navigation_bloc.dart';
import 'package:nav2_example/config/navigation/routes/home_route.dart';
import 'package:nav2_example/config/navigation/routes/posts_route.dart';
import 'package:nav2_example/config/navigation/routes/settings_route.dart';
import 'package:nav2_example/pages/home_page/tabs/home_tab.dart';
import 'package:nav2_example/pages/home_page/tabs/posts_tab.dart';
import 'package:nav2_example/pages/home_page/tabs/settings_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationBloc get bloc => context.read();

  static const routes = [
    HomeRoute.path,
    PostsRoute.path,
    SettingsRoute.path,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final currentIndex = routes.indexWhere(
          (element) => state.configs.map((e) => e.uri.path).contains(element),
        );
        return Scaffold(
          body: SafeArea(
            child: Navigator(
              onPopPage: (route, result) {
                if (state.canPop()) {
                  bloc.add(const ClosePageNavigationEvent());
                  return false;
                }
                return true;
              },
              pages: state.configs.expand<Page>((config) sync* {
                switch (config.uri.path) {
                  case HomeRoute.path:
                    yield const MaterialPage(
                      key: ValueKey(HomeRoute.path),
                      child: HomeTab(),
                    );
                    break;
                  case PostsRoute.path:
                    yield const MaterialPage(
                      key: ValueKey(PostsRoute.path),
                      child: PostsTab(),
                    );
                    break;
                  case SettingsRoute.path:
                    yield const MaterialPage(
                      key: ValueKey(SettingsRoute.path),
                      child: SettingsTab(),
                    );
                    break;
                  default:
                    break;
                }
              }).toList(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              final destination = routes[value];
              bloc.add(ReplaceRouteNavigationEvent(destination));
            },
            currentIndex: currentIndex != -1 ? currentIndex : 0,
            items: routes
                .map((destination) => BottomNavigationBarItem(
                      icon: switch (destination) {
                        HomeRoute.path => const Icon(Icons.home),
                        PostsRoute.path => const Icon(Icons.contacts),
                        SettingsRoute.path => const Icon(Icons.settings),
                        _ => const Icon(Icons.error),
                      },
                      label: switch (destination) {
                        HomeRoute.path => 'Home',
                        PostsRoute.path => 'Posts',
                        SettingsRoute.path => 'Settings',
                        _ => '',
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
