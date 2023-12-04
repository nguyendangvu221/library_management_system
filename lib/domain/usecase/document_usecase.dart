import 'package:library_management_system/data/document_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';

class DocumentUsecase {
  final DocumentRepository documentRepository;
  DocumentUsecase({required this.documentRepository});
  Future<List<Document>> fetchListDocument() {
    return documentRepository.fetchListDocument();
  }
}
