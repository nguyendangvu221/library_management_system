import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

import 'package:library_management_system/domain/usecase/search_usecase.dart';

class SearchsController extends GetxController {
  SearchsController({required this.searchUsecase});
  final SearchUsecase searchUsecase;
  RxList<Document> rxListDocument = <Document>[].obs;

  TextEditingController searchController = TextEditingController();
  Future<void> searchDocumentByName(String name) async {
    List<Document> listDocument = await searchUsecase.searchDocumentByName(name);
    rxListDocument.value = listDocument;
  }

  Future<void> insertDocument(HiveDocument document, BuildContext context) async {
    await searchUsecase.insertDocument(document, context);
  }
}
