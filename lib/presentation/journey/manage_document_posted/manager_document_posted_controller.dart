import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/domain/usecase/manage_document_posted_usecase.dart';

class ManageDocumentPostedController extends GetxController {
  ManageDocumentPostedController({required this.manageDocumentPostedUsecase});
  final ManageDocumentPostedUsecase manageDocumentPostedUsecase;
  RxList<Document> rxListDocument = <Document>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchDocumentByName('');
  }

  Future<void> deleteDocument(String id) async {
    await manageDocumentPostedUsecase.deleteDocument(id);
  }

  Future<void> insertDocument(HiveDocument document, BuildContext context) async {
    await manageDocumentPostedUsecase.insertDocument(document, context);
  }

  TextEditingController searchController = TextEditingController();
  Future<void> searchDocumentByName(String name) async {
    List<Document> listDocument = await manageDocumentPostedUsecase.searchDocumentByName(name: name);
    rxListDocument.value = listDocument;
  }
}
