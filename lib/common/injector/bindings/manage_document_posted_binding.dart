import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/manage_document_posted/manager_document_posted_controller.dart';

class ManageDocumentPostedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<ManageDocumentPostedController>());
  }
}
