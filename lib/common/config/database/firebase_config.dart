import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseConfig {
  static late DatabaseReference dbRef;
  static Future<void> config() async {
    await Firebase.initializeApp();
    dbRef = FirebaseDatabase.instance.ref('/library');
  }
}
