import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/services/preferences_service.dart';

part 'settings_tab_event.dart';
part 'settings_tab_state.dart';

@injectable
class SettingsTabBloc extends Bloc<SettingsTabEvent, SettingsTabState> {
  final PreferensesService _preferensesService;

  SettingsTabBloc(this._preferensesService) : super(const SettingsTabState()) {
    on<LogoutSettingsTabEvent>(logout);
  }

  Future<void> logout(
    LogoutSettingsTabEvent event,
    Emitter<SettingsTabState> emit,
  ) async {
    emit(state.copyWith(status: SettingsTabStatus.loading));
    await _preferensesService.logout();

    emit(state.copyWith(
      status: _preferensesService.isLoggedIn
          ? SettingsTabStatus.error
          : SettingsTabStatus.success,
    ));
  }
}
