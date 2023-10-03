part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class OpenPageNavigationEvent extends NavigationEvent {
  final String path;
  final Map<String, dynamic>? args;

  const OpenPageNavigationEvent(this.path, [this.args]);

  @override
  List<Object?> get props => [path, args];
}

class ClosePageNavigationEvent extends NavigationEvent {
  final int count;

  const ClosePageNavigationEvent([this.count = 1]);

  @override
  List<Object?> get props => [count];
}

class ReplaceRouteNavigationEvent extends NavigationEvent {
  final String path;
  final Map<String, dynamic>? args;

  const ReplaceRouteNavigationEvent(this.path, [this.args]);

  @override
  List<Object?> get props => [path, args];
}

class OpenBeneathRouteNavigationEvent extends NavigationEvent {
  final String path;
  final Map<String, dynamic>? args;

  const OpenBeneathRouteNavigationEvent(this.path, [this.args]);

  @override
  List<Object?> get props => [path, args];
}

class ClearAndOpenRouteNavigationEvent extends NavigationEvent {
  final String path;
  final Map<String, dynamic>? args;

  const ClearAndOpenRouteNavigationEvent(this.path, [this.args]);

  @override
  List<Object?> get props => [path, args];
}
