import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';

class SearchsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<SearchsController>());
  }
}
