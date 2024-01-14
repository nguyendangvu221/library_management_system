import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_system/data/chat_repository.dart';

class ChatUsecase {
  ChatRepository chatRepository;
  ChatUsecase({required this.chatRepository});

  // Phương thức để lấy danh sách tin nhắn

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    return chatRepository.getMessages();
  }

  User? getCurrentUser() {
    return chatRepository.getCurrentUser();
  }

  // Phương thức để gửi tin nhắn
  void sendMessage(String message) async {
    chatRepository.sendMessage(message);
  }
}
