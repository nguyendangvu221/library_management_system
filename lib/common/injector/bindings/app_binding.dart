import 'package:get/get.dart';
import 'package:library_management_system/presentation/controllers/app_controller.dart';
import 'package:library_management_system/presentation/journey/splash/splash_controller.dart';

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
