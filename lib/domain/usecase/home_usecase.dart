import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_management_system/data/home_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class HomeUsecase {
  final HomeRepository repository;

  HomeUsecase(this.repository);

  Future<List<Document>> fetchListDocument() async {
    return await repository.fetchListDocument();
  }

  Future<void> insertDocument(HiveDocument hiveDocument, BuildContext context) async {
    await repository.insertDocument(hiveDocument, context);
  }

  Future<void> deleteDocument(int index) async {
    await repository.deleteDocument(index);
  }

  void clearHive() {
    repository.clearHive();
  }

  Future<Box<HiveDocument>> getDataHive() async {
    return await repository.getDataHive();
  }
}
