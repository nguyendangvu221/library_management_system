import 'dart:ffi';

import 'package:get/get.dart';
import 'package:library_management_system/presentation/controllers/app_controller.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_controller.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/journey/main/main_controller.dart';
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

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
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

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchsController());
  }
}

class BorrowerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BorrowerController());
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
