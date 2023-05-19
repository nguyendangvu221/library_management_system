import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/common/injector/bindings/app_binding.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_screen.dart';
import 'package:library_management_system/presentation/journey/book_shelf/book_shelf_screen.dart';
import 'package:library_management_system/presentation/journey/register/register_screen.dart';
import 'package:library_management_system/presentation/journey/splash/splash_page.dart';
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
    name: AppRoutes.search,
    page: () => const SearchScreen(),
    binding: SearchBinding(),
  ),
  GetPage(
    name: AppRoutes.bookShelf,
    page: () => const BookShelfScreen(),
    binding: BookShelfBinding(),
  ),
  GetPage(
    name: AppRoutes.addBook,
    page: () => const AddBookScreen(),
    binding: AddBookBinding(),
  ),
  GetPage(
    name: AppRoutes.user,
    page: () => const UserScreen(),
    binding: UserBinding(),
  ),
];
