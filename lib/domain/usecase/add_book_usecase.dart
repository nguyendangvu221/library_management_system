import 'package:library_management_system/data/document_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class AddBookUsecase {
  final DocumentRepository documentRepository;
  AddBookUsecase(this.documentRepository);
  Future<void> insertDocument(HiveDocument HiveDocument) async {
    await documentRepository.insertDocument(HiveDocument);
  }

  Future<void> updateDocument(HiveDocument HiveDocument, int index) async {
    await documentRepository.updateDocument(HiveDocument, index);
  }

  Future<void> deleteDocument(int index) async {
    await documentRepository.deleteDocument(index);
  }

  String? getCode(int index) {
    return documentRepository.getCode(index);
  }

  String? getName(int index) {
    return documentRepository.getName(index);
  }

  String? getAuthor(int index) {
    return documentRepository.getAuthor(index);
  }

  String? getPublisher(int index) {
    return documentRepository.getPublisher(index);
  }

  String? getCategory(int index) {
    return documentRepository.getCategory(index);
  }

  // String? getYearPublication(int index) {
  //   return documentRepository.getYearPublication(index);
  // }

  String? getDescription(int index) {
    return documentRepository.getDescription(index);
  }

  int? getNumberOfPage(int index) {
    return documentRepository.getNumberOfPage(index);
  }

  String? getPaperSize(int index) {
    return documentRepository.getPaperSize(index);
  }

  String? getReprint(int index) {
    return documentRepository.getReprint(index);
  }

  int? getNumberOfEditions(int index) {
    return documentRepository.getNumberOfEditions(index);
  }

  String? getReleaseDate(int index) {
    return documentRepository.getReleaseDate(index);
  }

  String? getUpdateDate(int index) {
    return documentRepository.getUpdateDate(index);
  }

  String? getImage(int index) {
    return documentRepository.getImage(index);
  }

  int getLength() {
    return documentRepository.getLength();
  }

  String? getLanguage(int index) {
    return documentRepository.getLanguage(index);
  }

  bool compareToCode(int i, String code) {
    return documentRepository.compareToId(i, code);
  }

  List<Document> getAllListDocument() {
    return documentRepository.getAllListDocument();
  }

  List<Document> getListBorrowedDocument() {
    return documentRepository.getListDocumentBorrowed();
  }

  int? getIndex(String code) {
    return documentRepository.getIndex(code);
  }

  List<Document> searchDocument(String name) {
    return documentRepository.searchDocument(name);
  }
}
