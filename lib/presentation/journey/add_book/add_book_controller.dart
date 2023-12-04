import 'dart:developer';

import 'package:analyzer/file_system/file_system.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';
import 'package:library_management_system/presentation/journey/main/main_screen.dart';

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
  bool checkValidate({required textValidator, required textController}) {
    if (textController.text.trim().isEmpty) {
      textValidator.value = "Vui lòng điền đủ các trường";
      return false;
    }
    return true;
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
    validateNameBook.value = '';
    validateAuthorBook.value = '';
    validateIdBook.value = '';
    validateCategoryBook.value = '';
    validatePublisherBook.value = '';
    validateDescriptionBook.value = '';
    validateNumberOfBook.value = '';
    validatePaperSizeBook.value = '';
    validateReprintBook.value = '';
    validateNumberOfEditionBook.value = '';
    validateReleaseDateBook.value = '';
    validateUpdateDateBook.value = '';
    validateLanguageBook.value = '';
    validateImageBook.value = '';
  }

  Future<void> addDocument() async {
    bool flag = false;

    if (!checkValidate(textController: nameBook, textValidator: validateNameBook)) {
      flag = true;
    }
    if (!checkValidate(textController: authorBook, textValidator: validateAuthorBook)) {
      flag = true;
    }
    if (!checkValidate(textController: categoryBook, textValidator: validateCategoryBook)) {
      flag = true;
    }
    if (!checkValidate(textController: publisherBook, textValidator: validatePublisherBook)) {
      flag = true;
    }
    if (!checkValidate(textController: descriptionBook, textValidator: validateDescriptionBook)) {
      flag = true;
    }
    if (!checkValidate(textController: numberOfBook, textValidator: validateNumberOfBook)) {
      flag = true;
    }
    if (!checkValidate(textController: paperSizeBook, textValidator: validatePaperSizeBook)) {
      flag = true;
    }
    if (!checkValidate(textController: reprintBook, textValidator: validateReprintBook)) {
      flag = true;
    }
    if (!checkValidate(textController: numberOfEditionsBook, textValidator: validateNumberOfEditionBook)) {
      flag = true;
    }
    if (!checkValidate(textController: releaseDateBook, textValidator: validateReleaseDateBook)) {
      flag = true;
    }
    if (!checkValidate(textController: updateDateBook, textValidator: validateUpdateDateBook)) {
      flag = true;
    }
    if (!checkValidate(textController: languageBook, textValidator: validateLanguageBook)) {
      flag = true;
    }
    if (!checkValidate(textController: imageBook, textValidator: validateImageBook)) {
      flag = true;
    }
    if (flag) {
      return;
    } else {
      clearData();
      Get.to(() => const MainScreen());
      Get.snackbar("Thêm sách", "Thêm sách thành công!!");
    }
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
}
