import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

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
      print('Lỗi khi lấy thông tin từ Firestore: $e');
    }
    log(fullName ?? '');
    return fullName;
  }
}
