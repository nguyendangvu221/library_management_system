import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<UserController>());
  }
}
