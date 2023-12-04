import 'package:library_management_system/data/document_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';

class AddBookUsecase {
  final DocumentRepository documentRepository;
  AddBookUsecase(this.documentRepository);
  Future<List<Document>> fetchListDocument() {
    return documentRepository.fetchListDocument();
  }
}
