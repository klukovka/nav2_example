part of 'login_page_bloc.dart';

sealed class LoginPageEvent extends Equatable {
  const LoginPageEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends LoginPageEvent {}
