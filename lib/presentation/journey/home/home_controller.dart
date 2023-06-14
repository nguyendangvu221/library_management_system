import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';

class HomeController extends GetxController {
  AddBookUsecase addBookUsecase;
  HomeController({required this.addBookUsecase});
  RxList<Document> listDocument = <Document>[].obs;

  void onInit() {
    super.onInit();
    addLocalData();
  }

  void delDocument(int index) {
    addBookUsecase.deleteDocument(index);
    addLocalData();
  }

  void addLocalData() {
    listDocument.value = addBookUsecase.getAllListDocument();
  }
}
