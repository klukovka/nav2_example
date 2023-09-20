part of 'settings_page_cubit.dart';

enum SettingsPageStatus {
  idle,
  loading,
  success,
  error,
}

class SettingsPageState extends Equatable {
  final SettingsPageStatus status;
  const SettingsPageState({
    this.status = SettingsPageStatus.idle,
  });

  @override
  List<Object> get props => [status];

  SettingsPageState copyWith({
    SettingsPageStatus? status,
  }) {
    return SettingsPageState(
      status: status ?? this.status,
    );
  }
}
