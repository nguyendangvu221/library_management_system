import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<HomeController>());
  }
}
