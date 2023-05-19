import 'dart:ffi';

import 'package:get/get.dart';
import 'package:library_management_system/presentation/controllers/app_controller.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';
import 'package:library_management_system/presentation/journey/book_shelf/book_shelf_controller.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';
import 'package:library_management_system/presentation/journey/splash/splash_controller.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}

class BookShelfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookShelfController());
  }
}

class AddBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddBookController());
  }
}

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
