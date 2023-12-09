import 'package:get/get.dart';

import 'package:library_management_system/presentation/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
