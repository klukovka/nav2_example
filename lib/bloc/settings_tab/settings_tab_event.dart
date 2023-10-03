part of 'settings_tab_bloc.dart';

sealed class SettingsTabEvent extends Equatable {
  const SettingsTabEvent();

  @override
  List<Object> get props => [];
}

class LogoutSettingsTabEvent extends SettingsTabEvent {}
