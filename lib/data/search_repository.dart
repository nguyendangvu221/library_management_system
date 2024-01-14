import 'package:library_management_system/common/config/network/dio_client.dart';
import 'package:library_management_system/domain/models/document_model.dart';

class SearchRepository {
  final DioClient dioClient;
  SearchRepository({
    required this.dioClient,
  });
  Future<List<Document>> searchDocumentByName(String name) async {
    try {
      final response = await dioClient.get(endpoint: '/documents/search?name=$name');
      var jsonList = response.data as List;
      List<Document> listDocument = jsonList.map((e) => Document.fromJson(e)).toList();
      return listDocument;
    } catch (e) {
      return [];
    }
  }
}
