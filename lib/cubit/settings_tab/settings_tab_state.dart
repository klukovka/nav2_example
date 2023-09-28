part of 'settings_tab_bloc.dart';

enum SettingsTabStatus {
  idle,
  loading,
  success,
  error,
}

class SettingsTabState extends Equatable {
  final SettingsTabStatus status;
  const SettingsTabState({
    this.status = SettingsTabStatus.idle,
  });

  @override
  List<Object> get props => [status];

  SettingsTabState copyWith({
    SettingsTabStatus? status,
  }) {
    return SettingsTabState(
      status: status ?? this.status,
    );
  }
}
