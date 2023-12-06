import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddBookController extends GetxController {
  TextEditingController nameBook = TextEditingController();
  TextEditingController authorBook = TextEditingController();
  TextEditingController categoryBook = TextEditingController();
  TextEditingController publisherBook = TextEditingController();
  TextEditingController descriptionBook = TextEditingController();
  TextEditingController numberOfBook = TextEditingController();
  TextEditingController paperSizeBook = TextEditingController();
  TextEditingController reprintBook = TextEditingController();
  TextEditingController numberOfEditionsBook = TextEditingController();
  TextEditingController releaseDateBook = TextEditingController();
  TextEditingController updateDateBook = TextEditingController();
  TextEditingController languageBook = TextEditingController();
  RxString pdfPicker = ''.obs;
  RxString namePdf = ''.obs;
  RxString imageBook = ''.obs;
  RxString nameImage = ''.obs;
  RxString validateNameBook = ''.obs;
  RxString validateAuthorBook = ''.obs;
  RxString validateIdBook = ''.obs;
  RxString validateCategoryBook = ''.obs;
  RxString validatePublisherBook = ''.obs;
  RxString validateDescriptionBook = ''.obs;
  RxString validateNumberOfBook = ''.obs;
  RxString validatePaperSizeBook = ''.obs;
  RxString validateReprintBook = ''.obs;
  RxString validateNumberOfEditionBook = ''.obs;
  RxString validateReleaseDateBook = ''.obs;
  RxString validateUpdateDateBook = ''.obs;
  RxString validateLanguageBook = ''.obs;
  RxString validateImageBook = ''.obs;
  final AddBookUsecase addBookUsecase;
  AddBookController({required this.addBookUsecase});
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addDocument() async {
    if (validate1()) {
      return;
    } else {
      Get.snackbar("Thêm sách", "Thêm sách thành công!!");
      Get.offAllNamed(AppRoutes.main);
      await uploadDataAndFilesToFirebase();
      clearData();
    }
  }

  void clearData() {
    nameBook.clear();
    authorBook.clear();
    categoryBook.clear();
    publisherBook.clear();
    descriptionBook.clear();
    numberOfBook.clear();
    paperSizeBook.clear();
    reprintBook.clear();
    numberOfEditionsBook.clear();
    releaseDateBook.clear();
    updateDateBook.clear();
    languageBook.clear();
    pdfPicker.value = '';
    namePdf.value = '';
    imageBook.value = '';
    nameImage.value = '';
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageBook.value = pickedFile.path;
      nameImage.value = pickedFile.path.split('/').last;
    }
  }

  Future<void> pickedFile() async {
    final pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      pdfPicker.value = pickedFile.files.single.path!;
      namePdf.value = pickedFile.files.single.name;
    }
  }

  Future<String> uploadFileToFirebaseStorage(String filePath, String storagePath) async {
    return await addBookUsecase.uploadFileToFirebaseStorage(filePath, storagePath);
  }

  Future<void> uploadDataAndFilesToFirebase() async {
    await addBookUsecase.uploadDataAndFilesToFirebase(
      nameBook: nameBook.text,
      authorBook: authorBook.text,
      categoryBook: categoryBook.text,
      publisherBook: publisherBook.text,
      descriptionBook: descriptionBook.text,
      numberOfBook: numberOfBook.text,
      paperSizeBook: paperSizeBook.text,
      reprintBook: reprintBook.text,
      numberOfEditionsBook: numberOfEditionsBook.text,
      releaseDateBook: releaseDateBook.text,
      updateDateBook: updateDateBook.text,
      languageBook: languageBook.text,
      imageBook: imageBook.value,
      pdfPicker: pdfPicker.value,
    );
  }

  bool validate1() {
    bool isValid = true;
    // Kiểm tra và đặt giá trị cho errorName
    if (nameBook.text.isEmpty) {
      validateNameBook.value = 'Tên không được để trống';
      isValid = false;
    } else {
      validateNameBook.value = '';
    }
    if (authorBook.text.isEmpty) {
      validateAuthorBook.value = 'Tác giả không được để trống';
      isValid = false;
    } else {
      validateAuthorBook.value = '';
    }
    if (categoryBook.text.isEmpty) {
      validateCategoryBook.value = 'Thể loại không được để trống';
      isValid = false;
    } else {
      validateCategoryBook.value = '';
    }
    if (publisherBook.text.isEmpty) {
      validatePublisherBook.value = 'Nhà xuất bản không được để trống';
      isValid = false;
    } else {
      validatePublisherBook.value = '';
    }
    if (descriptionBook.text.isEmpty) {
      validateDescriptionBook.value = 'Mô tả không được để trống';
      isValid = false;
    } else {
      validateDescriptionBook.value = '';
    }
    if (numberOfBook.text.isEmpty) {
      validateNumberOfBook.value = 'Số lượng không được để trống';
      isValid = false;
    } else {
      validateNumberOfBook.value = '';
    }
    if (paperSizeBook.text.isEmpty) {
      validatePaperSizeBook.value = 'Kích thước không được để trống';
      isValid = false;
    } else {
      validatePaperSizeBook.value = '';
    }
    if (reprintBook.text.isEmpty) {
      validateReprintBook.value = 'Lần tái bản không được để trống';
      isValid = false;
    } else {
      validateReprintBook.value = '';
    }
    if (numberOfEditionsBook.text.isEmpty) {
      validateNumberOfEditionBook.value = 'Số lần xuất bản không được để trống';
      isValid = false;
    } else {
      validateNumberOfEditionBook.value = '';
    }
    if (releaseDateBook.text.isEmpty) {
      validateReleaseDateBook.value = 'Ngày xuất bản không được để trống';
      isValid = false;
    } else {
      validateReleaseDateBook.value = '';
    }
    if (updateDateBook.text.isEmpty) {
      validateUpdateDateBook.value = 'Ngày cập nhật không được để trống';
      isValid = false;
    } else {
      validateUpdateDateBook.value = '';
    }
    if (languageBook.text.isEmpty) {
      validateLanguageBook.value = 'Ngôn ngữ không được để trống';
      isValid = false;
    } else {
      validateLanguageBook.value = '';
    }

    return isValid;
  }

// Phương thức để tải file lên Firebase Storage
}
