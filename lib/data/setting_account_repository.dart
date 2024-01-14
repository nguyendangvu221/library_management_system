import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class SettingAccountRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<User?> getCurrentUser() async {
    return firebaseAuth.currentUser;
  }

  Future<UserModel> getUserById() {
    return firestore.collection("users").doc(firebaseAuth.currentUser!.uid).get().then(
          (value) => UserModel.fromJson(
            {
              "id": value.id,
              ...value.data() ?? {},
            },
          ),
        );
  }

  Future<void> pickImageFromGallery({required String imageBook, required String nameImage}) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBook = pickedFile.path;
      nameImage = pickedFile.path.split('/').last;
    }
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
      log(url);
      return url;
    } catch (error) {
      log('Failed to upload file to Firebase Storage: $error');
      return '';
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String avatar,
    required String gender,
    required DateTime dateOfBirth,
  }) async {
    String imageUrl = await uploadFileToFirebaseStorage(avatar, 'images');
    await firestore.collection("users").doc(firebaseAuth.currentUser!.uid).update({
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "avatar": imageUrl.trim().isEmpty ? avatar : imageUrl,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
    });
  }
}
