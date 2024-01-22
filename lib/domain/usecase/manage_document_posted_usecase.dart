import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_management_system/data/manage_document_posted_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class ManageDocumentPostedUsecase {
  ManageDocumentPostedRepository manageDocumentPostedRepository;
  ManageDocumentPostedUsecase({required this.manageDocumentPostedRepository});
  Future<void> deleteDocument(String id) async {
    await manageDocumentPostedRepository.deleteDocument(id);
  }

  Future<List<Document>> searchDocumentByName({required String name}) async {
    return await manageDocumentPostedRepository.searchDocumentByName(
      name: name,
    );
  }

  Future<void> insertDocument(HiveDocument hiveDocument, BuildContext context) async {
    await manageDocumentPostedRepository.insertDocument(hiveDocument, context);
  }

  Future<void> deleteHiveDocument(int index) async {
    await manageDocumentPostedRepository.deleteHiveDocument(index);
  }

  void clearHive() {
    manageDocumentPostedRepository.clearHive();
  }

  Future<Box<HiveDocument>> getDataHive() async {
    return await manageDocumentPostedRepository.getDataHive();
  }
}
