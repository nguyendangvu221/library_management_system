import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class UserRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<UserModel>> fetchListUser() async {
    List<UserModel> listUser = [];
    User? user = firebaseAuth.currentUser;
    await firestore.collection('users').get().then((value) {
      for (var element in value.docs) {
        if (element.id == user?.uid) continue;
        listUser.add(UserModel.fromJson({
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

  Future<String> uploadFileToFirebaseStorage(String filePath, String storagePath) async {
    try {
      UploadTask? uploadTask;
      final File file = File(filePath);
      final String fileName = path.basename(file.path);
      final storageRef = storage.ref().child('$storagePath/$fileName');
      uploadTask = storageRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(
        () {},
      );
      final url = await snapshot.ref.getDownloadURL();
      return url;
    } catch (error) {
      return '';
    }
  }

  Future<String?> register1({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String address,
    required DateTime dateOfBirth,
    required String gender,
    required String avatar,
  }) async {
    try {
      // Tạo tài khoản mới mà không đăng nhập tự động
      UserCredential userCredential = await registerNoLogin(email, password);
      String uid = userCredential.user?.uid ?? '';
      // Thêm thông tin người dùng vào Firestore với UID
      String? message = await addUserToFirestore(
        uid: uid,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        dateOfBirth: dateOfBirth,
        avatar: avatar,
        email: email,
        gender: gender,
      );
      Get.snackbar('Success', 'Registered successfully');
      return message;
    } catch (e) {
      // Xử lý lỗi khi tạo tài khoản
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.');
        } else {
          Get.snackbar('Error', 'Registration failed. ${e.message}');
        }
      } else {
        // Xử lý lỗi chung (nếu cần)
        Get.snackbar('Error', 'Registration failed. $e');
      }
    }
  }

  Future<UserModel> getUserById(String id) {
    return firestore.collection("users").doc(id).get().then(
          (value) => UserModel.fromJson(
            {
              "id": value.id,
              ...value.data() ?? {},
            },
          ),
        );
  }

  static Future<UserCredential> registerNoLogin(String email, String password) async {
    FirebaseApp app = await Firebase.initializeApp(name: 'Secondary', options: Firebase.app().options);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: email, password: password);
      await app.delete();
      return Future.sync(() => userCredential);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<String?> addUserToFirestore({
    required String uid,
    required String name,
    required String phoneNumber,
    required String address,
    required DateTime dateOfBirth,
    required String email,
    required String gender,
    required String avatar,
  }) async {
    String imageUrl = await uploadFileToFirebaseStorage(avatar, 'images');
    return firestore
        .collection('users')
        .doc(uid) // Sử dụng UID làm ID của tài liệu trong Firestore
        .set({
          'name': name,
          'phoneNumber': phoneNumber,
          'address': address,
          'dateOfBirth': dateOfBirth,
          'email': email,
          'gender': gender,
          'role': 1,
          'avatar': imageUrl,
        })
        .then((value) async => "200")
        .catchError((error) => error.toString());
  }

  Future<String> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String avatar,
    required String gender,
    required DateTime dateOfBirth,
  }) async {
    String imageUrl = await uploadFileToFirebaseStorage(avatar, 'images');
    return await firestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .update({
          "name": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "address": address,
          "avatar": imageUrl.trim().isEmpty ? avatar : imageUrl,
          "gender": gender,
          "dateOfBirth": dateOfBirth,
        })
        .then((value) => "200")
        .catchError((e) => e.toString());
  }

  Future<List<UserModel>> searchUsers(String keyword) async {
    List<UserModel> searchResults = [];
    try {
      // Thực hiện truy vấn tìm kiếm trong Firestore
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('users')
          .where('name', isGreaterThanOrEqualTo: keyword)
          .where('name', isLessThan: '${keyword}z')
          .get();
      // Xử lý kết quả truy vấn
      for (var document in querySnapshot.docs) {
        searchResults.add(UserModel.fromJson({
          'id': document.id,
          ...document.data(),
        }));
      }
      // ignore: empty_catches
    } catch (e) {}

    return searchResults;
  }
}
