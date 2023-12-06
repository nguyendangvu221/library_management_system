import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddBookRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String?> getFullNameByEmail(String email) async {
    String? fullName;
    try {
      QuerySnapshot querySnapshot = await firestore.collection('users').where('email', isEqualTo: email).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Lấy thông tin từ trường 'fullName'
        fullName = querySnapshot.docs.first['name'];
      }
    } catch (e) {
      print('Lỗi khi lấy thông tin từ Firestore: $e');
    }
    return fullName;
  }

  Future<void> pickImageFromGallery({required String imageBook, required String nameImage}) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBook = pickedFile.path;
      nameImage = pickedFile.path.split('/').last;
    }
  }

  Future<void> pickedFile({required String pdfPicker, required String namePdf}) async {
    final pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      pdfPicker = pickedFile.files.single.path!;
      namePdf = pickedFile.files.single.name;
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

  Future<void> uploadDataAndFilesToFirebase({
    required String nameBook,
    required String authorBook,
    required String categoryBook,
    required String publisherBook,
    required String descriptionBook,
    required String numberOfBook,
    required String paperSizeBook,
    required String reprintBook,
    required String numberOfEditionsBook,
    required String releaseDateBook,
    required String updateDateBook,
    required String languageBook,
    required String imageBook,
    required String pdfPicker,
  }) async {
    try {
      // Upload ảnh lên Firebase Storage và lấy URL
      String imageUrl = await uploadFileToFirebaseStorage(imageBook, 'images');

      // Upload file PDF lên Firebase Storage và lấy URL
      String pdfUrl = await uploadFileToFirebaseStorage(pdfPicker, 'pdfs');

      // Upload dữ liệu lên Firestore
      await firestore.collection('documents').add({
        'name': nameBook,
        'author': authorBook,
        'category': categoryBook,
        'publisher': publisherBook,
        'description': descriptionBook,
        'numberOfBook': int.parse(numberOfBook),
        'postedBy': await getFullNameByEmail('email'),
        'paperSize': paperSizeBook,
        'reprint': reprintBook,
        'numberOfEditions': int.parse(numberOfEditionsBook),
        'releaseDate': releaseDateBook,
        'updateDate': updateDateBook,
        'language': languageBook,
        'image': imageUrl,
        'pdf': pdfUrl,
      });

      print('Data and files uploaded successfully');
    } catch (error) {
      print('Failed to upload data and files: $error');
    }
  }
}
