import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';

class AddBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<AddBookController>());
  }
}
