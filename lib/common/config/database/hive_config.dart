import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_management_system/common/config/database/hive_type_constants.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_account.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveConfig {
  late Box<HiveDocument> documentBox;
  late Box<HiveBorrower> userBox;
  late Box<HiveAccounts> accountBox;

  Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Hive.registerAdapter(HiveDocumentAdapter());
    Hive.registerAdapter(HiveBorrowerAdapter());
    Hive.registerAdapter(HiveAccountsAdapter());
    documentBox = await Hive.openBox(HiveKey.document);
    userBox = await Hive.openBox(HiveKey.user);
    accountBox = await Hive.openBox(HiveKey.accounts);
  }
}
