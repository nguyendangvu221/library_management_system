import 'package:library_management_system/data/search_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';

class SearchUsecase {
  SearchRepository searchRepository;
  SearchUsecase({required this.searchRepository});
  Future<List<Document>> searchDocumentByName(String name) async {
    return await searchRepository.searchDocumentByName(name);
  }
}
