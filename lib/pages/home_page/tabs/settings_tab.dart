import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav2_example/cubit/navigation/navigation_cubit.dart';
import 'package:nav2_example/cubit/settings_page/settings_page_cubit.dart';
import 'package:nav2_example/di/locator.dart';
import 'package:nav2_example/models/destination.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SettingsTabCubit>(),
      child: BlocConsumer<SettingsTabCubit, SettingsTabState>(
        listener: (context, state) {
          switch (state.status) {
            case SettingsTabStatus.success:
              context.read<NavigationCubit>().replaceRoute({
                Destination.login,
              });
              break;
            case SettingsTabStatus.error:
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Failed to Logout'),
              ));
            default:
          }
        },
        builder: (context, state) {
          return Center(
            child: state.status == SettingsTabStatus.loading
                ? const CircularProgressIndicator.adaptive()
                : ElevatedButton(
                    onPressed: context.read<SettingsTabCubit>().logout,
                    child: const Text('Press to Logout'),
                  ),
          );
        },
      ),
    );
  }
}
