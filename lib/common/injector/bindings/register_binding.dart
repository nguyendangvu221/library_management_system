import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<RegisterController>());
  }
}
