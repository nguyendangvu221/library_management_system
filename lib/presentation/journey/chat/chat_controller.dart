import 'package:get/get.dart';
import 'package:library_management_system/domain/usecase/chat_usecase.dart';

class ChatController extends GetxController {
  ChatUsecase chatUsecase;
  ChatController({required this.chatUsecase});
}
