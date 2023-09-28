import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/cubit/navigation/navigation_bloc.dart';
import 'package:nav2_example/models/destination.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        final currentIndex = Destination.loggedInPages.indexWhere(
          (element) => state.currentRoute.contains(element),
        );
        return Scaffold(
          body: SafeArea(
            child: Navigator(
              onPopPage: (route, result) {
                if (state.previousRoutes.isNotEmpty) {
                  bloc.add(const ClosePageNavigationEvent());
                  return false;
                }
                return true;
              },
              pages: state.currentRoute.expand<Page>((destination) sync* {
                switch (destination) {
                  case Destination.home:
                    yield const MaterialPage(
                      key: ValueKey(Destination.home),
                      child: HomeTab(),
                    );
                    break;
                  case Destination.posts:
                    yield const MaterialPage(
                      key: ValueKey(Destination.posts),
                      child: PostsTab(),
                    );
                    break;
                  case Destination.settings:
                    yield const MaterialPage(
                      key: ValueKey(Destination.settings),
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
              final destination = Destination.loggedInPages[value];
              bloc.add(ReplaceRouteNavigationEvent({destination}));
            },
            currentIndex: currentIndex != -1 ? currentIndex : 0,
            items: Destination.loggedInPages
                .map((destination) => BottomNavigationBarItem(
                      icon: switch (destination) {
                        Destination.home => const Icon(Icons.home),
                        Destination.posts => const Icon(Icons.contacts),
                        Destination.settings => const Icon(Icons.settings),
                        _ => const Icon(Icons.error),
                      },
                      label: switch (destination) {
                        Destination.home => 'Home',
                        Destination.posts => 'Contacts',
                        Destination.settings => 'Settings',
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
