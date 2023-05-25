import 'package:flutter/material.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_screen.dart';
import 'package:library_management_system/presentation/journey/book_shelf/book_shelf_screen.dart';
import 'package:library_management_system/presentation/journey/home/home_screen.dart';
import 'package:library_management_system/presentation/journey/search/search_screen.dart';
import 'package:library_management_system/presentation/journey/user/user_screen.dart';

enum MainItem {
  home,
  search,
  bookShelf,
  addBook,
  user,
}

extension MainItemExtension on MainItem {
  Widget getScreen() {
    switch (this) {
      case MainItem.home:
        return const HomeScreen();
      case MainItem.search:
        return const SearchScreen();
      case MainItem.bookShelf:
        return const BookShelfScreen();
      case MainItem.addBook:
        return const AddBookScreen();
      case MainItem.user:
        return const UserScreen();
    }
  }

  int getIndex() {
    switch (this) {
      case MainItem.home:
        return 0;
      case MainItem.search:
        return 1;
      case MainItem.bookShelf:
        return 2;
      case MainItem.addBook:
        return 3;
      case MainItem.user:
        return 4;
    }
  }

  IconData getIcon() {
    switch (this) {
      case MainItem.home:
        return Icons.home;
      case MainItem.search:
        return Icons.search;
      case MainItem.bookShelf:
        return Icons.library_books;
      case MainItem.addBook:
        return Icons.library_add;
      case MainItem.user:
        return Icons.person;
    }
  }
}
