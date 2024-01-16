import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_management_system/data/search_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class SearchUsecase {
  SearchRepository searchRepository;
  SearchUsecase({required this.searchRepository});
  Future<List<Document>> searchDocumentByName(String name) async {
    return await searchRepository.searchDocumentByName(name);
  }

  Future<void> insertDocument(HiveDocument hiveDocument, BuildContext context) async {
    await searchRepository.insertDocument(hiveDocument, context);
  }

  Future<void> deleteHiveDocument(int index) async {
    await searchRepository.deleteHiveDocument(index);
  }

  void clearHive() {
    searchRepository.clearHive();
  }

  Future<Box<HiveDocument>> getDataHive() async {
    return await searchRepository.getDataHive();
  }
}
