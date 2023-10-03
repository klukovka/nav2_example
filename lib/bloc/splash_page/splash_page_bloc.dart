import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/services/preferences_service.dart';

part 'splash_page_event.dart';
part 'splash_page_state.dart';

@injectable
class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  final PreferensesService _preferensesService;

  SplashPageBloc(this._preferensesService)
      : super(const SplashPageState(
          status: SplashPageStatus.loading,
        )) {
    on<InitialSplashPageEvent>(init);
  }

  Future<void> init(
    InitialSplashPageEvent event,
    Emitter<SplashPageState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(
      status: _preferensesService.isLoggedIn
          ? SplashPageStatus.authorized
          : SplashPageStatus.unauthorized,
    ));
  }
}
