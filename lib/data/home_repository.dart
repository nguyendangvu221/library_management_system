import 'package:cloud_firestore/cloud_firestore.dart';
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

  // ignore: non_constant_identifier_names
  Future<void> insertDocument(HiveDocument HiveDocument) async {
    await hiveConfig.documentBox.add(HiveDocument);
  }

  // ignore: non_constant_identifier_names
  Future<void> updateDocument(HiveDocument HiveDocument, int index) async {
    await hiveConfig.documentBox.putAt(index, HiveDocument);
  }

  Future<void> deleteDocument(int index) async {
    await hiveConfig.documentBox.deleteAt(index);
  }

  int? getIndex(String code) {
    for (int i = 0; i < hiveConfig.documentBox.length; i++) {
      if (hiveConfig.documentBox.values.elementAt(i).code == code) {
        return i;
      }
    }
    return null;
  }

  String? getCode(int index) {
    return hiveConfig.documentBox.getAt(index)?.code;
  }

  String? getName(int index) {
    return hiveConfig.documentBox.getAt(index)?.name;
  }

  String? getAuthor(int index) {
    return hiveConfig.documentBox.getAt(index)?.author;
  }

  String? getPublisher(int index) {
    return hiveConfig.documentBox.getAt(index)?.publisher;
  }

  String? getCategory(int index) {
    return hiveConfig.documentBox.getAt(index)?.category;
  }

  // String? getYearPublication(int index) {
  //   return hiveConfig.documentBox.getAt(index)?.yearPublication;
  // }

  String? getDescription(int index) {
    return hiveConfig.documentBox.getAt(index)?.description;
  }

  int? getNumberOfPage(int index) {
    return hiveConfig.documentBox.getAt(index)?.numberOfPage;
  }

  String? getPaperSize(int index) {
    return hiveConfig.documentBox.getAt(index)?.paperSize;
  }

  String? getReprint(int index) {
    return hiveConfig.documentBox.getAt(index)?.reprint;
  }

  int? getNumberOfEditions(int index) {
    return hiveConfig.documentBox.getAt(index)?.numberOfEditions;
  }

  String? getReleaseDate(int index) {
    return hiveConfig.documentBox.getAt(index)?.releaseDate;
  }

  String? getUpdateDate(int index) {
    return hiveConfig.documentBox.getAt(index)?.updateDate;
  }

  String? getImage(int index) {
    return hiveConfig.documentBox.getAt(index)?.image;
  }

  String? getLanguage(int index) {
    return hiveConfig.documentBox.getAt(index)?.language;
  }

  int getLength() {
    return hiveConfig.documentBox.length;
  }

  bool compareToId(int i, String code) {
    if (hiveConfig.documentBox.values.elementAt(i).code == code) return true;
    return false;
  }
}
