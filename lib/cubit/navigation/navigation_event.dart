part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class OpenPageNavigationEvent extends NavigationEvent {
  final Destination route;

  const OpenPageNavigationEvent(this.route);

  @override
  List<Object?> get props => [route];
}

class ClosePageNavigationEvent extends NavigationEvent {
  final int count;

  const ClosePageNavigationEvent([this.count = 1]);

  @override
  List<Object?> get props => [count];
}

class ReplaceRouteNavigationEvent extends NavigationEvent {
  final Set<Destination> route;
  final List<Set<Destination>>? previousRoutes;

  const ReplaceRouteNavigationEvent(
    this.route, {
    this.previousRoutes,
  });

  @override
  List<Object?> get props => [route, previousRoutes];
}

class RestoreRouteEvent extends NavigationEvent {
  final NavigationState state;

  const RestoreRouteEvent(this.state);

  @override
  List<Object?> get props => [state];
}
