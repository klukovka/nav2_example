part of 'splash_page_bloc.dart';

enum SplashPageStatus {
  loading,
  authorized,
  unauthorized;
}

class SplashPageState extends Equatable {
  final SplashPageStatus status;

  const SplashPageState({
    required this.status,
  });

  SplashPageState copyWith({
    SplashPageStatus? status,
  }) {
    return SplashPageState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
