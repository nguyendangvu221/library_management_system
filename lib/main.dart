import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/firebase/firebase_options.dart';
import 'presentation/app.dart';

Future<void> main() async {
  configLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  final hiveSetUp = getIt<HiveConfig>();
  await hiveSetUp.init();
  runApp(const App());
}
