import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/usecase/document_usecase.dart';

class HomeController extends GetxController {
  DocumentUsecase documentUsecase;
  HomeController({
    required this.documentUsecase,
  });

  RxList<Document> listDocument = <Document>[].obs;

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    listDocument.value = await documentUsecase.fetchListDocument();
    update(); // Đảm bảo cập nhật UI khi thay đổi giá trị của RxList
  }
}
