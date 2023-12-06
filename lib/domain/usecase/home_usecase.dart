import 'package:library_management_system/data/home_repository.dart';
import 'package:library_management_system/domain/models/document_model.dart';

class HomeUsecase {
  final HomeRepository repository;

  HomeUsecase(this.repository);

  Future<List<Document>> fetchListDocument() async {
    return await repository.fetchListDocument();
  }
}
