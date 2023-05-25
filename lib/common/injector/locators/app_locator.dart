import 'package:get_it/get_it.dart';
import 'package:library_management_system/presentation/controllers/app_controller.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';
import 'package:library_management_system/presentation/journey/book_shelf/book_shelf_controller.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/journey/main/main_controller.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';
import 'package:library_management_system/presentation/journey/splash/splash_controller.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';

GetIt getIt = GetIt.instance;

void configLocator() {
  //controller
  getIt.registerLazySingleton(() => AppController());
  getIt.registerFactory<SplashController>(() => SplashController());
  getIt.registerFactory<MainController>(() => MainController());
  getIt.registerFactory(() => HomeController());
  getIt.registerFactory(() => LoginController());
  getIt.registerFactory(() => RegisterController());
  getIt.registerFactory(() => SearchController());
  getIt.registerFactory(() => BookShelfController());
  getIt.registerFactory(() => AddBookController());
  getIt.registerFactory(() => UserController());

  //usecase

  //
}
