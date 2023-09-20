import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/services/preferences_service.dart';

part 'login_page_state.dart';

@injectable
class LoginPageCubit extends Cubit<LoginPageState> {
  final PreferensesService _preferensesService;

  LoginPageCubit(
    this._preferensesService,
  ) : super(const LoginPageState());

  Future<void> login() async {
    emit(state.copyWith(status: LoginPageStatus.loading));
    await _preferensesService.login();

    emit(state.copyWith(
      status: _preferensesService.isLoggedIn
          ? LoginPageStatus.success
          : LoginPageStatus.error,
    ));
  }
}
