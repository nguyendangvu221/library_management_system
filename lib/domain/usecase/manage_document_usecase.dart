import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_management_system/data/manage_document_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class ManageDocumentUsecase {
  ManageDocumentRepository manageDocumentRepository;
  ManageDocumentUsecase({required this.manageDocumentRepository});
  Future<void> deleteDocument(String id) async {
    await manageDocumentRepository.deleteDocument(id);
  }

  Future<List<Document>> searchDocumentByName({required String name}) async {
    return await manageDocumentRepository.searchDocumentByName(
      name: name,
    );
  }

  Future<void> insertDocument(HiveDocument hiveDocument, BuildContext context) async {
    await manageDocumentRepository.insertDocument(hiveDocument, context);
  }

  Future<void> deleteHiveDocument(int index) async {
    await manageDocumentRepository.deleteHiveDocument(index);
  }

  void clearHive() {
    manageDocumentRepository.clearHive();
  }

  Future<Box<HiveDocument>> getDataHive() async {
    return await manageDocumentRepository.getDataHive();
  }
}
