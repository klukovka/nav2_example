import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
@preResolve
class PreferensesService {
  static const _boxKey = '_boxKey';
  static const _loggedInKey = '_loggedInKey';

  final Box<bool> _box;

  PreferensesService._(this._box);

  @factoryMethod
  static Future<PreferensesService> getInstance() async {
    final box = await Hive.openBox<bool>(_boxKey);
    return PreferensesService._(box);
  }

  bool get isLoggedIn => _box.get(_boxKey) ?? false;

  Future<void> login() async {
    await _box.put(_loggedInKey, true);
  }

  Future<void> logout() async {
    await _box.put(_loggedInKey, false);
  }
}
