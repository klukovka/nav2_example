import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/models/destination.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

@singleton
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<OpenPageNavigationEvent>(openPage);
    on<ClosePageNavigationEvent>(closePage);
    on<ReplaceRouteNavigationEvent>(replaceRoute);
    on<RestoreRouteEvent>(restoreState);
  }

  void openPage(
    OpenPageNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    if (state.currentRoute.contains(event.route)) {
      emit(state);
      return;
    }
    emit(state.copyWith(
      currentRoute: {...state.currentRoute, event.route},
      previousRoutes: [...state.previousRoutes, state.currentRoute],
    ));
  }

  void closePage(
    ClosePageNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(
      currentRoute:
          state.previousRoutes[state.previousRoutes.length - event.count],
      previousRoutes: state.previousRoutes
          .sublist(0, state.previousRoutes.length - event.count),
    ));
  }

  void replaceRoute(
    ReplaceRouteNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    emit(state.copyWith(
      previousRoutes: event.previousRoutes ?? state.previousRoutes,
      currentRoute: event.route,
    ));
  }

  void restoreState(
    RestoreRouteEvent event,
    Emitter<NavigationState> emit,
  ) {
    emit(event.state);
  }
}
