import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/setting_account/setting_account_controller.dart';

class SettingAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<SettingAccountController>());
  }
}
