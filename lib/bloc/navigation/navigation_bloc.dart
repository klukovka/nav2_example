import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/config/navigation/app_page.dart';
import 'package:nav2_example/config/navigation/page_config.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc(@factoryParam List<PageConfig> initialPages)
      : super(NavigationState(initialPages)) {
    on<OpenPageNavigationEvent>(_openPage);
    on<ClosePageNavigationEvent>(_closePage);
    on<ReplaceRouteNavigationEvent>(_replaceRoute);
    on<OpenBeneathRouteNavigationEvent>(_pushBeneathCurrent);
    on<ClearAndOpenRouteNavigationEvent>(_clearAndPush);
  }

  void _openPage(
    OpenPageNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    PageConfig config = PageConfig(location: event.path, args: event.args);
    emit(state.push(config));
  }

  void _closePage(
    ClosePageNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    for (int i = 0; i < event.count; i++) {
      emit(state.pop());
    }
  }

  void _replaceRoute(
    ReplaceRouteNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    PageConfig config = PageConfig(location: event.path, args: event.args);
    emit(state.replace(config));
  }

  void _pushBeneathCurrent(
    OpenBeneathRouteNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    PageConfig config = PageConfig(location: event.path, args: event.args);
    emit(state.pushBeneathCurrent(config));
  }

  void _clearAndPush(
    ClearAndOpenRouteNavigationEvent event,
    Emitter<NavigationState> emit,
  ) {
    PageConfig config = PageConfig(location: event.path, args: event.args);
    emit(state.clearAndPush(config));
  }
}
