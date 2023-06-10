import 'package:get/get.dart';
import 'package:flutter/material.dart';

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

  bool checkValidate({required textValidator, required textController}) {
    if (textController.text.trim().isEmpty) {
      textValidator.value = "Vui lòng điền đủ các trường";
      return false;
    }
    return true;
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
    }
  }
}
