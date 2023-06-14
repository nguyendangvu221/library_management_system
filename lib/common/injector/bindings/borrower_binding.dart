import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_controller.dart';

class BorrowerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<BorrowerController>());
  }
}
