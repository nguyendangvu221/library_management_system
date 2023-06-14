import 'package:flutter/material.dart';
import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'presentation/app.dart';

Future<void> main() async {
  configLocator();
  WidgetsFlutterBinding.ensureInitialized();
  final hiveSetUp = getIt<HiveConfig>();
  await hiveSetUp.init();
  runApp(const App());
}
