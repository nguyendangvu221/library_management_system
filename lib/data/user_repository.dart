import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class UserRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<User>> fetchListUser() async {
    List<User> listUser = [];
    await firestore.collection('users').get().then((value) {
      for (var element in value.docs) {
        listUser.add(User.fromJson({
          'id': element.id,
          ...element.data(),
        }));
      }
    });
    return listUser;
  }

  Future<void> deleteUserData(String id) async {
    await firestore.collection('users').doc(id).delete();
  }

  Future<List<User>> searchUsers(String keyword) async {
    List<User> searchResults = [];
    try {
      // Thực hiện truy vấn tìm kiếm trong Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('users')
          .where('name', isGreaterThanOrEqualTo: keyword)
          .where('name', isLessThan: '${keyword}z')
          .get();
      // Xử lý kết quả truy vấn
      for (var document in querySnapshot.docs) {
        searchResults.add(User.fromJson({
          'id': document.id,
          ...document.data(),
        }));
      }
    } catch (e) {
      print('Error searching users: $e');
    }

    return searchResults;
  }
}
