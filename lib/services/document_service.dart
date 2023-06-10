import 'package:firebase_database/firebase_database.dart';
import 'package:library_management_system/common/config/database/firebase_config.dart';

class DocumentService {
  Stream<DatabaseEvent> getAllDocumentListStream() {
    return FirebaseConfig.dbRef.onValue;
  }

  void addDocumentInFirebase(String? id) {
    FirebaseConfig.dbRef.child(id ?? "unknow");
  }
}
