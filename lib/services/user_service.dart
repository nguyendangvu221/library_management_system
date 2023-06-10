import 'package:firebase_database/firebase_database.dart';
import 'package:library_management_system/common/config/database/firebase_config.dart';

class UserService {
  Stream<DatabaseEvent> getAllUserListStream() {
    return FirebaseConfig.dbRef.onValue;
  }

  void addUser(String? code) {
    FirebaseConfig.dbRef.child(code ?? "unknow");
  }
}
