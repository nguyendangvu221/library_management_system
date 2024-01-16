import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:library_management_system/common/config/network/dio_client.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AddBookRepository {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DioClient dioClient;
  AddBookRepository({required this.dioClient});

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  Future<UserModel> getUserById(String id) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firestore.collection("users").doc(id).get();
    return UserModel.fromJson({
      "id": documentSnapshot.id,
      ...documentSnapshot.data() ?? {},
    });
  }

  Future<void> upDocumentToDB({
    required String nameBook,
    required String authorBook,
    required String categoryBook,
    required String publisherBook,
    required String descriptionBook,
    required String numberOfBook,
    required String paperSizeBook,
    required String reprintBook,
    required String numberOfEditionsBook,
    required DateTime releaseDateBook,
    required String languageBook,
    required String imageBook,
    required String pdfPicker,
    required String idPoster,
    required String namePoster,
  }) async {
    try {
      String imageUrl = await uploadFileToFirebaseStorage(imageBook, 'images');

      // Upload file PDF lên Firebase Storage và lấy URL
      String pdfUrl = await uploadFileToFirebaseStorage(pdfPicker, 'pdfs');

      final response = await dioClient.post(endpoint: '/documents', data: {
        "name": nameBook,
        "author": authorBook,
        "idPoster": idPoster,
        "category": categoryBook,
        "publisher": publisherBook,
        "description": descriptionBook,
        "numberOfPage": numberOfBook,
        "reprint": reprintBook,
        "numberOfEditions": numberOfEditionsBook,
        "language": languageBook,
        "releaseDate": releaseDateBook.toIso8601String(),
        "image": imageUrl,
        "pdf": pdfUrl,
        "namePoster": namePoster,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String?> getFullNameByEmail(String email) async {
    String? fullName;
    try {
      QuerySnapshot querySnapshot = await firestore.collection('users').where('email', isEqualTo: email).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Lấy thông tin từ trường 'fullName'
        fullName = querySnapshot.docs.first['name'];
      }
    } catch (e) {
      log('Lỗi khi lấy thông tin từ Firestore: $e');
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
        'language': languageBook,
        'image': imageUrl,
        'pdf': pdfUrl,
      });

      log('Data and files uploaded successfully');
    } catch (error) {
      log('Failed to upload data and files: $error');
    }
  }
}
