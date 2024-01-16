import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/manage_document/manage_document_controller.dart';

class ManageDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<ManageDocumentController>());
  }
}
