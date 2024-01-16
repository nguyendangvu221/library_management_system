import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_system/data/chat_repository.dart';
import 'package:library_management_system/domain/models/user_model.dart';

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

  Future<UserModel> getUserById(String id) async {
    return chatRepository.getUserById(id);
  }

  // Phương thức để gửi tin nhắn
  void sendMessage(String message) async {
    chatRepository.sendMessage(message);
  }
}
