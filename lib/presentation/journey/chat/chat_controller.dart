import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/usecase/chat_usecase.dart';

class ChatController extends GetxController {
  ChatController({required this.chatUsecase});
  ChatUsecase chatUsecase;

  RxBool isScrolledToBottom = true.obs;

  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  // Stream để lắng nghe thay đổi trong collection "messages"
  Rx<ScrollController> scrollController = ScrollController().obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    if (scrollController.value.hasClients) {
      scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    return chatUsecase.getMessages();
  }

  User? getCurrentUser() {
    return chatUsecase.getCurrentUser();
  }

  void sendMessage(String message) {
    chatUsecase.sendMessage(message);
    textEditingController.value.clear();
  }
}
