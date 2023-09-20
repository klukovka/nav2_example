import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/services/preferences_service.dart';

part 'splash_page_state.dart';

@injectable
class SplashPageCubit extends Cubit<SplashPageState> {
  final PreferensesService _preferensesService;

  SplashPageCubit(this._preferensesService)
      : super(const SplashPageState(
          status: SplashPageStatus.loading,
        )) {
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(
      status: _preferensesService.isLoggedIn
          ? SplashPageStatus.authorized
          : SplashPageStatus.unauthorized,
    ));
  }
}
