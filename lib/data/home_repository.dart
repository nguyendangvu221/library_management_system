import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/common/config/network/dio_client.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class HomeRepository {
  final HiveConfig hiveConfig;
  final DioClient dioClient;
  HomeRepository({
    required this.hiveConfig,
    required this.dioClient,
  });

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Document>> fetchListDocument() async {
    try {
      final response = await dioClient.get(endpoint: '/documents');
      var jsonList = response.data as List;
      List<Document> listDocument = jsonList.map((e) => Document.fromJson(e)).toList();
      return listDocument;
    } catch (e) {
      return [];
    }
  }

  Future<Box<HiveDocument>> getDataHive() async {
    return hiveConfig.documentBox;
  }

  Future<void> insertDocument(HiveDocument hiveDocument, BuildContext context) async {
    String localPdfPath = await getApplicationDocumentsDirectoryPath(hiveDocument.id ?? '', 'pdf');
    String localImagePath = await getApplicationDocumentsDirectoryPath(hiveDocument.id ?? '', 'image');

    await downloadAndSaveFile(hiveDocument.pdf ?? '', localPdfPath);
    await downloadAndSaveFile(hiveDocument.image ?? '', localImagePath);

    hiveDocument.pdf = localPdfPath;
    hiveDocument.image = localImagePath;
    bool isExist = false;
    for (int i = 0; i < hiveConfig.documentBox.length; i++) {
      HiveDocument hiveDocumentBox = hiveConfig.documentBox.getAt(i) as HiveDocument;
      if (hiveDocumentBox.id == hiveDocument.id) {
        isExist = true;
      }
    }

    if (!isExist) {
      await hiveConfig.documentBox.add(hiveDocument);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thêm tài liệu thành công'),
          ),
        );
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thêm tài liệu thất bại'),
          ),
        );
      }
    }
  }

  void clearHive() {
    hiveConfig.documentBox.clear();
  }

  Future<String> getApplicationDocumentsDirectoryPath(String documentId, String fileType) async {
    var appDocDir = await getApplicationDocumentsDirectory();
    return path.join(appDocDir.path, '${documentId}_$fileType');
  }

  Future<void> updateDocument(HiveDocument hiveDocument, int index) async {
    String localPdfPath = await getApplicationDocumentsDirectoryPath(hiveDocument.id ?? '', 'pdf');
    String localImagePath = await getApplicationDocumentsDirectoryPath(hiveDocument.id ?? '', 'image');

    await downloadAndSaveFile(hiveDocument.pdf ?? '', localPdfPath);
    await downloadAndSaveFile(hiveDocument.image ?? '', localImagePath);

    hiveDocument.pdf = localPdfPath;
    hiveDocument.image = localImagePath;

    await hiveConfig.documentBox.putAt(index, hiveDocument);
  }

  Future<void> deleteDocument(int index) async {
    HiveDocument hiveDocument = hiveConfig.documentBox.getAt(index) as HiveDocument;

    File localPdfFile = File(hiveDocument.pdf ?? '');
    File localImageFile = File(hiveDocument.image ?? '');

    await localPdfFile.delete();
    await localImageFile.delete();

    await hiveConfig.documentBox.deleteAt(index);
  }

  Future<void> downloadAndSaveFile(String url, String localPath) async {
    Dio dio = Dio();
    final response = await dio.get(url, options: Options(responseType: ResponseType.bytes));
    File file = File(localPath);
    await file.writeAsBytes(response.data);
  }
}
