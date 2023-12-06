import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:library_management_system/common/config/database/hive_config.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class HomeRepository {
  final HiveConfig hiveConfig;
  HomeRepository(this.hiveConfig);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<Document>> fetchListDocument() async {
    List<Document> listDocument = [];
    await firestore.collection('documents').get().then((value) {
      for (var element in value.docs) {
        listDocument.add(Document.fromJson({
          'id': element.id,
          'pdf': element.data()['pdf'],
          ...element.data(),
        }));
      }
    });
    return listDocument;
  }

  Future<void> insertDocument(HiveDocument HiveDocument) async {
    await hiveConfig.documentBox.add(HiveDocument);
  }

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

  List<Document> getAllListDocument() {
    List<Document> listDocument = [];
    for (int i = 0; i < hiveConfig.documentBox.length; i++) {
      listDocument.add(
        Document(
          name: hiveConfig.documentBox.values.elementAt(i).name,
          author: hiveConfig.documentBox.values.elementAt(i).author,
          category: hiveConfig.documentBox.values.elementAt(i).category,
          code: hiveConfig.documentBox.values.elementAt(i).code,
          description: hiveConfig.documentBox.values.elementAt(i).description,
          numberOfEditions: hiveConfig.documentBox.values.elementAt(i).numberOfEditions,
          numberOfPage: hiveConfig.documentBox.values.elementAt(i).numberOfPage,
          paperSize: hiveConfig.documentBox.values.elementAt(i).paperSize,
          publisher: hiveConfig.documentBox.values.elementAt(i).publisher,
          releaseDate: hiveConfig.documentBox.values.elementAt(i).releaseDate,
          reprint: hiveConfig.documentBox.values.elementAt(i).reprint,
          updateDate: hiveConfig.documentBox.values.elementAt(i).updateDate,
          language: hiveConfig.documentBox.values.elementAt(i).language,
          image: hiveConfig.documentBox.values.elementAt(i).image,
        ),
      );
    }
    return listDocument;
  }

  List<Document> getListDocumentBorrowed() {
    List<Document> listDocument = [];
    for (int i = 0; i < hiveConfig.documentBox.length; i++) {
      if (hiveConfig.documentBox.values.elementAt(i).isBorrowed == true) {
        listDocument.add(
          Document(
            name: hiveConfig.documentBox.values.elementAt(i).name,
            author: hiveConfig.documentBox.values.elementAt(i).author,
            category: hiveConfig.documentBox.values.elementAt(i).category,
            code: hiveConfig.documentBox.values.elementAt(i).code,
            description: hiveConfig.documentBox.values.elementAt(i).description,
            numberOfEditions: hiveConfig.documentBox.values.elementAt(i).numberOfEditions,
            numberOfPage: hiveConfig.documentBox.values.elementAt(i).numberOfPage,
            paperSize: hiveConfig.documentBox.values.elementAt(i).paperSize,
            publisher: hiveConfig.documentBox.values.elementAt(i).publisher,
            releaseDate: hiveConfig.documentBox.values.elementAt(i).releaseDate,
            reprint: hiveConfig.documentBox.values.elementAt(i).reprint,
            updateDate: hiveConfig.documentBox.values.elementAt(i).updateDate,
            language: hiveConfig.documentBox.values.elementAt(i).language,
            image: hiveConfig.documentBox.values.elementAt(i).image,
          ),
        );
      }
    }
    return listDocument;
  }

  List<Document> searchDocument(String name) {
    List<Document> listDocument = [];
    for (int index = 0; index < hiveConfig.documentBox.length; index++) {
      if (hiveConfig.documentBox.values.elementAt(index).name != null) {
        if (hiveConfig.documentBox.values.elementAt(index).name!.toLowerCase().contains(name.toLowerCase())) {
          listDocument.add(
            Document(
              name: hiveConfig.documentBox.values.elementAt(index).name,
              author: hiveConfig.documentBox.values.elementAt(index).author,
              category: hiveConfig.documentBox.values.elementAt(index).category,
              code: hiveConfig.documentBox.values.elementAt(index).code,
              description: hiveConfig.documentBox.values.elementAt(index).description,
              numberOfPage: hiveConfig.documentBox.values.elementAt(index).numberOfPage,
              numberOfEditions: hiveConfig.documentBox.values.elementAt(index).numberOfEditions,
              paperSize: hiveConfig.documentBox.values.elementAt(index).paperSize,
              publisher: hiveConfig.documentBox.values.elementAt(index).publisher,
              releaseDate: hiveConfig.documentBox.values.elementAt(index).releaseDate,
              reprint: hiveConfig.documentBox.values.elementAt(index).reprint,
              updateDate: hiveConfig.documentBox.values.elementAt(index).updateDate,
              language: hiveConfig.documentBox.values.elementAt(index).language,
              image: hiveConfig.documentBox.values.elementAt(index).image,
            ),
          );
        }
      }
    }
    return listDocument;
  }
}
