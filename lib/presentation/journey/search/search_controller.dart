import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';

class SearchsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  AddBookUsecase addBookUsecase;
  SearchsController({required this.addBookUsecase});
  RxList<Document> rxListDocument = <Document>[].obs;

  void searchDocument(String name) {
    // rxListDocument.value = addBookUsecase.searchDocument(name);
  }
}
