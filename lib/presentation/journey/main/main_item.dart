import 'package:flutter/material.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_screen.dart';
import 'package:library_management_system/presentation/journey/chat/chat_screen.dart';
import 'package:library_management_system/presentation/journey/home/home_screen.dart';
import 'package:library_management_system/presentation/journey/setting/setting_screen.dart';

enum MainItem {
  home,
  chat,
  addBook,
  setting,
}

extension MainItemExtension on MainItem {
  Widget getScreen() {
    switch (this) {
      case MainItem.home:
        return const HomeScreen();
      case MainItem.chat:
        return const ChatPage();
      case MainItem.addBook:
        return const AddBookScreen();
      case MainItem.setting:
        return const SettingScreen();
    }
  }

  int getIndex() {
    switch (this) {
      case MainItem.home:
        return 0;
      case MainItem.chat:
        return 1;
      case MainItem.addBook:
        return 2;
      case MainItem.setting:
        return 3;
    }
  }

  IconData getIcon() {
    switch (this) {
      case MainItem.home:
        return Icons.home;
      case MainItem.chat:
        return Icons.message_rounded;
      case MainItem.addBook:
        return Icons.library_add;
      case MainItem.setting:
        return Icons.person;
    }
  }
}
