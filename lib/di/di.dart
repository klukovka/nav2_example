import 'package:injectable/injectable.dart';
import 'package:nav2_example/di/locator.dart';

import 'di.config.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await $configureDependencies(locator);
}
