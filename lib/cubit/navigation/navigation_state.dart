part of 'navigation_cubit.dart';

@singleton
class NavigationState extends Equatable {
  final List<Set<Destination>> previousRoutes;
  final Set<Destination> currentRoute;

  const NavigationState({
    this.previousRoutes = const [],
    this.currentRoute = const {Destination.splash},
  });

  NavigationState copyWith({
    List<Set<Destination>>? previousRoutes,
    Set<Destination>? currentRoute,
  }) {
    return NavigationState(
      previousRoutes: previousRoutes ?? this.previousRoutes,
      currentRoute: currentRoute ?? this.currentRoute,
    );
  }

  @override
  List<Object> get props => [previousRoutes, currentRoute];
}
