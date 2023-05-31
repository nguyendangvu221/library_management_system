import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveConfig {
  late Box<Document> documentBox;

  Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    // Hive.registerAdapter(HiveDocumentAdapter());
    documentBox = await Hive.openBox(HiveKey.document);
  }
}
