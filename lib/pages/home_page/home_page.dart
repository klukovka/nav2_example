import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/cubit/navigation/navigation_cubit.dart';
import 'package:nav2_example/models/destination.dart';
import 'package:nav2_example/pages/home_page/tabs/contacts_tab.dart';
import 'package:nav2_example/pages/home_page/tabs/home_tab.dart';
import 'package:nav2_example/pages/home_page/tabs/settings_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationCubit get cubit => context.read();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Navigator(
            onPopPage: (route, result) {
              if (state.previousRoutes.isNotEmpty) {
                cubit.closePage();
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
                case Destination.contacts:
                  yield const MaterialPage(
                    key: ValueKey(Destination.contacts),
                    child: ContactsTab(),
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
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              final destination = Destination.loggedInPages[value];
              cubit.replaceRoute({destination});
            },
            currentIndex: Destination.loggedInPages.indexWhere(
              (element) => state.currentRoute.contains(element),
            ),
            items: Destination.loggedInPages
                .map((destination) => BottomNavigationBarItem(
                      icon: switch (destination) {
                        Destination.home => const Icon(Icons.home),
                        Destination.contacts => const Icon(Icons.contacts),
                        Destination.settings => const Icon(Icons.settings),
                        _ => const Icon(Icons.error),
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
