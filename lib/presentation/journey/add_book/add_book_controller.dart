import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';

class AddBookController extends GetxController {
  TextEditingController nameBook = TextEditingController();
  TextEditingController authorBook = TextEditingController();
  TextEditingController idBook = TextEditingController();
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
  TextEditingController imageBook = TextEditingController();
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
    idBook.clear();
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
    imageBook.clear();
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

    if (!checkValidate(
        textController: nameBook, textValidator: validateNameBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: authorBook, textValidator: validateAuthorBook)) {
      flag = true;
    }
    if (!checkValidate(textController: idBook, textValidator: validateIdBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: categoryBook, textValidator: validateCategoryBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: publisherBook, textValidator: validatePublisherBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: descriptionBook,
        textValidator: validateDescriptionBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: numberOfBook, textValidator: validateNumberOfBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: paperSizeBook, textValidator: validatePaperSizeBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: reprintBook, textValidator: validateReprintBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: numberOfEditionsBook,
        textValidator: validateNumberOfEditionBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: releaseDateBook,
        textValidator: validateReleaseDateBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: updateDateBook,
        textValidator: validateUpdateDateBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: languageBook, textValidator: validateLanguageBook)) {
      flag = true;
    }
    if (!checkValidate(
        textController: imageBook, textValidator: validateImageBook)) {
      flag = true;
    }
    if (flag) {
      return;
    } else {
      addBookUsecase.insertDocument(
        HiveDocument(
          name: nameBook.text,
          author: authorBook.text,
          category: categoryBook.text,
          code: idBook.text,
          description: descriptionBook.text,
          language: languageBook.text,
          numberOfEditions: int.parse(numberOfEditionsBook.text),
          numberOfPage: int.parse(numberOfBook.text),
          paperSize: paperSizeBook.text,
          publisher: publisherBook.text,
          reprint: reprintBook.text,
          releaseDate: releaseDateBook.text,
          updateDate: updateDateBook.text,
          image: imageBook.text,
        ),
      );
      clearData();
    }
  }
}
