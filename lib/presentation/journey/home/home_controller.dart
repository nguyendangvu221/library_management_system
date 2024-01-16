import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/domain/usecase/home_usecase.dart';

class HomeController extends GetxController {
  HomeUsecase homeUsecase;
  HomeController({
    required this.homeUsecase,
  });
  @override
  void onInit() async {
    await fetchData();
    await fetDataHiveBox();
    super.onInit();
  }

  @override
  void onReady() async {
    await fetchData();
    await fetDataHiveBox();
    super.onReady();
  }

  Future<void> insertDocument(HiveDocument document, BuildContext context) async {
    await homeUsecase.insertDocument(document, context);
  }

  RxList<Document> listDocument = <Document>[].obs;
  RxList<HiveDocument> listHiveDocument = <HiveDocument>[].obs;

  RxList<Document> listDocumentSearch = <Document>[].obs;
  String getCurrentEmail() {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        log(currentUser.phoneNumber ?? '');
        return currentUser.email ?? '';
      } else {
        return 'dell co';
      }
    } catch (e) {
      log('Error in getCurrentEmail(): $e');
      return '';
    }
  }

  Future<Box<HiveDocument>> getDataHive() async {
    return await homeUsecase.getDataHive();
  }

  Future<void> deleteDocument(int index) async {
    await homeUsecase.deleteDocument(index);
  }

  void clearHiveDocument() {
    homeUsecase.clearHive();
  }

  Future<void> fetDataHiveBox() async {
    listHiveDocument.value = await homeUsecase.getDataHive().then((value) => value.values.toList());
  }

  Future<void> fetchData() async {
    listDocument.value = await homeUsecase.fetchListDocument();
  }
}
