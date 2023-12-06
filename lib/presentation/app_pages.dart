import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/common/injector/bindings/add_book_binding.dart';
import 'package:library_management_system/common/injector/bindings/user_binding.dart';
import 'package:library_management_system/common/injector/bindings/home_binding.dart';
import 'package:library_management_system/common/injector/bindings/login_binding.dart';
import 'package:library_management_system/common/injector/bindings/main_binding.dart';
import 'package:library_management_system/common/injector/bindings/register_binding.dart';
import 'package:library_management_system/common/injector/bindings/search_binding.dart';
import 'package:library_management_system/common/injector/bindings/splash_binding.dart';
import 'package:library_management_system/common/injector/bindings/setting_binding.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_screen.dart';
import 'package:library_management_system/presentation/journey/home/home_screen.dart';
import 'package:library_management_system/presentation/journey/main/main_screen.dart';
import 'package:library_management_system/presentation/journey/register/register_screen.dart';
import 'package:library_management_system/presentation/journey/splash/splash_page.dart';
import 'package:library_management_system/presentation/journey/setting/setting_screen.dart';
import 'package:library_management_system/presentation/journey/user/user_screen.dart';

import 'journey/login/login_screen.dart';
import 'journey/search/search_screen.dart';

List<GetPage> myPages = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: AppRoutes.main,
    page: () => const MainScreen(),
    bindings: [
      MainBinding(),
      HomeBinding(),
      SearchsBinding(),
      SettingBinding(),
      AddBookBinding(),
      UserBinding(),
      SettingBinding(),
    ],
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => const RegisterScreen(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoutes.search,
    page: () => const SearchScreen(),
    binding: SearchsBinding(),
  ),
  GetPage(
    name: AppRoutes.user,
    page: () => const UserScreen(),
    binding: UserBinding(),
  ),
  GetPage(
    name: AppRoutes.addBook,
    page: () => const AddBookScreen(),
    binding: AddBookBinding(),
  ),
  GetPage(
    name: AppRoutes.setting,
    page: () => const SettingScreen(),
    binding: SettingBinding(),
  ),
];
