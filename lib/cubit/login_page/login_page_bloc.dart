import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/services/preferences_service.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

@injectable
class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final PreferensesService _preferensesService;

  LoginPageBloc(this._preferensesService) : super(const LoginPageState()) {
    on<LoginEvent>(login);
  }

  Future<void> login(LoginEvent event, Emitter<LoginPageState> emit) async {
    emit(state.copyWith(status: LoginPageStatus.loading));
    await _preferensesService.login();

    emit(state.copyWith(
      status: _preferensesService.isLoggedIn
          ? LoginPageStatus.success
          : LoginPageStatus.error,
    ));
  }
}
