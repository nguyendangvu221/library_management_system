import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<UserModel> getUserById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await _firestore.collection("users").doc(id).get();
    return UserModel.fromJson({
      "id": documentSnapshot.id,
      ...documentSnapshot.data() ?? {},
    });
  }
  // Phương thức để lấy danh sách tin nhắn

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages() {
    return _firestore.collection("messages").orderBy('timestamp', descending: false).snapshots();
  }

  // Phương thức để gửi tin nhắn
  void sendMessage(String message) async {
    final UserModel user = await getUserById(getCurrentUser()!.uid);
    _firestore.collection("messages").add({
      "content": message,
      "timestamp": FieldValue.serverTimestamp(),
      "user": user.name,
      "userId": user.id,
      "avatar": user.avatar,
    });
  }
}
