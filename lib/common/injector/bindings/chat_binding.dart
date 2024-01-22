import 'package:get/get.dart';
import 'package:library_management_system/common/injector/locators/app_locator.dart';
import 'package:library_management_system/presentation/journey/chat/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(getIt<ChatController>());
  }
}
