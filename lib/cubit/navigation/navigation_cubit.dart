import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/models/destination.dart';

part 'navigation_state.dart';

@singleton
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void closePage({int count = 1}) {
    emit(
      state.copyWith(
        currentRoute: state.previousRoutes[state.previousRoutes.length - count],
        previousRoutes: state.previousRoutes
            .sublist(0, state.previousRoutes.length - count),
      ),
    );
  }

  void openPage(Destination route) {
    if (state.currentRoute.contains(route)) {
      emit(state);
      return;
    }
    emit(state.copyWith(
      currentRoute: {...state.currentRoute, route},
      previousRoutes: [...state.previousRoutes, state.currentRoute],
    ));
  }

  void replaceRoute(
    Set<Destination> route, {
    List<Set<Destination>>? previousRoutes,
  }) {
    emit(state.copyWith(
      previousRoutes: previousRoutes ?? state.previousRoutes,
      currentRoute: route,
    ));
  }
}
