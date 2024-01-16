import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/domain/usecase/manage_document_usecase.dart';

class ManageDocumentController extends GetxController {
  ManageDocumentController({required this.manageDocumentUsecase});
  final ManageDocumentUsecase manageDocumentUsecase;
  RxList<Document> rxListDocument = <Document>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchDocumentByName('');
  }

  Future<void> deleteDocument(String id) async {
    await manageDocumentUsecase.deleteDocument(id);
  }

  Future<void> insertDocument(HiveDocument document, BuildContext context) async {
    await manageDocumentUsecase.insertDocument(document, context);
  }

  TextEditingController searchController = TextEditingController();
  Future<void> searchDocumentByName(String name) async {
    List<Document> listDocument = await manageDocumentUsecase.searchDocumentByName(name: name);
    rxListDocument.value = listDocument;
  }
}
