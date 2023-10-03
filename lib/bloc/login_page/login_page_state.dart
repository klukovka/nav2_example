part of 'login_page_bloc.dart';

enum LoginPageStatus {
  idle,
  loading,
  success,
  error,
}

class LoginPageState extends Equatable {
  final LoginPageStatus status;

  const LoginPageState({
    this.status = LoginPageStatus.idle,
  });

  @override
  List<Object> get props => [status];

  LoginPageState copyWith({
    LoginPageStatus? status,
  }) {
    return LoginPageState(
      status: status ?? this.status,
    );
  }
}
