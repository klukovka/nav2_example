import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/services/preferences_service.dart';

part 'settings_page_state.dart';

@injectable
class SettingsPageCubit extends Cubit<SettingsPageState> {
  final PreferensesService _preferensesService;

  SettingsPageCubit(
    this._preferensesService,
  ) : super(const SettingsPageState());

  Future<void> logout() async {
    emit(state.copyWith(status: SettingsPageStatus.loading));
    await _preferensesService.logout();

    emit(state.copyWith(
      status: _preferensesService.isLoggedIn
          ? SettingsPageStatus.error
          : SettingsPageStatus.success,
    ));
  }
}
