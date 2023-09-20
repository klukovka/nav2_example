import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/services/preferences_service.dart';

part 'settings_page_state.dart';

@injectable
class SettingsTabCubit extends Cubit<SettingsTabState> {
  final PreferensesService _preferensesService;

  SettingsTabCubit(
    this._preferensesService,
  ) : super(const SettingsTabState());

  Future<void> logout() async {
    emit(state.copyWith(status: SettingsTabStatus.loading));
    await _preferensesService.logout();

    emit(state.copyWith(
      status: _preferensesService.isLoggedIn
          ? SettingsTabStatus.error
          : SettingsTabStatus.success,
    ));
  }
}
