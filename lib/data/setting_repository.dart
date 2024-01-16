import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class SettingRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<String?> getFullNameByEmail(String email) async {
    String? fullName;
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where(
            'email',
            isEqualTo: email,
          )
          .limit(1)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        fullName = querySnapshot.docs.first['name'];
      }
    } catch (e) {
      log('Lỗi khi lấy thông tin từ Firestore: $e');
    }
    log(fullName ?? '');
    return fullName;
  }

  String? getId() {
    String id = FirebaseAuth.instance.currentUser?.uid ?? '';
    return id;
  }

  Future<UserModel> getUserById() {
    final id = getId();
    return firestore.collection("users").doc(id).get().then(
          (value) => UserModel.fromJson(
            {
              "id": value.id,
              ...value.data() ?? {},
            },
          ),
        );
  }
}
