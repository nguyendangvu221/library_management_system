import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_borrowed_document.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/domain/usecase/add_book_usecase.dart';
import 'package:library_management_system/domain/usecase/borrower_usecase.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';
import 'package:library_management_system/presentation/journey/home/book_screen.dart';
import 'package:library_management_system/presentation/journey/home/edit_book.dart';
import 'package:library_management_system/presentation/journey/main/main_screen.dart';

class HomeController extends GetxController {
  AddBookUsecase addBookUsecase;
  BorrowerUsecase borrowerUsecase;
  RegisterUseCase registerUseCase;
  HomeController(
      {required this.addBookUsecase,
      required this.borrowerUsecase,
      required this.registerUseCase});
  RxList<Document> listDocument = <Document>[].obs;
  RxList<Document> listBorrowed = <Document>[].obs;
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

  void onInit() {
    super.onInit();
    addLocalData();
  }

  bool checkValidate({required textValidator, required textController}) {
    if (textController.text.trim().isEmpty) {
      textValidator.value = "Vui lòng điền đủ các trường";
      return false;
    }
    return true;
  }

  void addTextEditing(int index) {
    nameBook.text = addBookUsecase.getName(index) ?? "";
    authorBook.text = addBookUsecase.getAuthor(index) ?? "";
    idBook.text = addBookUsecase.getCode(index) ?? "";
    categoryBook.text = addBookUsecase.getCategory(index) ?? "";
    publisherBook.text = addBookUsecase.getPublisher(index) ?? "";
    descriptionBook.text = addBookUsecase.getDescription(index) ?? "";
    numberOfBook.text = addBookUsecase.getNumberOfPage(index).toString();
    paperSizeBook.text = addBookUsecase.getPaperSize(index) ?? "";
    reprintBook.text = addBookUsecase.getReprint(index) ?? "";
    numberOfEditionsBook.text =
        addBookUsecase.getNumberOfEditions(index).toString();
    releaseDateBook.text = addBookUsecase.getReleaseDate(index) ?? "";
    updateDateBook.text = addBookUsecase.getUpdateDate(index) ?? "";
    languageBook.text = addBookUsecase.getLanguage(index) ?? "";
    imageBook.text = addBookUsecase.getImage(index) ?? "";
  }

  void delDocument(int index) {
    addBookUsecase.deleteDocument(index);
    addLocalData();
    addDocumentBorrowed();
  }

  void delBorrowedDocument(int index) {
    addBookUsecase.updateDocument(
      HiveDocument(
        name: addBookUsecase.getName(index),
        author: addBookUsecase.getAuthor(index),
        category: addBookUsecase.getCategory(index),
        code: addBookUsecase.getCode(index),
        description: addBookUsecase.getDescription(index),
        language: addBookUsecase.getLanguage(index),
        numberOfEditions: addBookUsecase.getNumberOfEditions(index),
        numberOfPage: addBookUsecase.getNumberOfPage(index),
        paperSize: addBookUsecase.getPaperSize(index),
        publisher: addBookUsecase.getPublisher(index),
        reprint: addBookUsecase.getReprint(index),
        releaseDate: addBookUsecase.getReleaseDate(index),
        updateDate: addBookUsecase.getUpdateDate(index),
        image: addBookUsecase.getImage(index),
        isBorrowed: false,
      ),
      index,
    );
    addDocumentBorrowed();
    ;
    addLocalData();
    addDocumentBorrowed();
  }

  Function()? onTapDocument(int index, bool isBookShelf) {
    return () {
      Future.delayed(const Duration(seconds: 1), () {
        Get.to(
          () => BookScreen(
            document: listDocument[index],
            index: index,
            isBookShelf: isBookShelf,
          ),
        );
      });
    };
  }

  Function()? onTapEditDocument(int index) {
    return () {
      addTextEditing(index);
      Future.delayed(const Duration(seconds: 1), () {
        Get.to(
          () => EditBookScreen(
            index: index,
          ),
        );
      });
    };
  }

  Function()? onTapAddBorrower(int index) {
    return () {
      addBookUsecase.updateDocument(
        HiveDocument(
          name: addBookUsecase.getName(index),
          author: addBookUsecase.getAuthor(index),
          category: addBookUsecase.getCategory(index),
          code: addBookUsecase.getCode(index),
          description: addBookUsecase.getDescription(index),
          language: addBookUsecase.getLanguage(index),
          numberOfEditions: addBookUsecase.getNumberOfEditions(index),
          numberOfPage: addBookUsecase.getNumberOfPage(index),
          paperSize: addBookUsecase.getPaperSize(index),
          publisher: addBookUsecase.getPublisher(index),
          reprint: addBookUsecase.getReprint(index),
          releaseDate: addBookUsecase.getReleaseDate(index),
          updateDate: addBookUsecase.getUpdateDate(index),
          image: addBookUsecase.getImage(index),
          isBorrowed: true,
        ),
        index,
      );
      addDocumentBorrowed();
      final List<HiveBorrowedDocument> listHiveBorrowed = [];
      listHiveBorrowed.add(
        HiveBorrowedDocument(
          nameDocument: addBookUsecase.getName(index),
          idDocument: addBookUsecase.getCode(index),
          loanPeriod: calLoanPreiod(
            addBookUsecase.getReleaseDate(index),
          ),
        ),
      );
      log(listHiveBorrowed.elementAt(0).loanPeriod.toString());
      for (int i = 0; i < borrowerUsecase.getLength(); i++) {
        if (borrowerUsecase.getIsLogin(i) == true) {
          borrowerUsecase.updateBorrower(
            HiveBorrower(
              codeUser: borrowerUsecase.getCode(i),
              email: borrowerUsecase.getEmail(i),
              nameUser: borrowerUsecase.getName(i),
              borrowedDocument: listHiveBorrowed,
            ),
            i,
          );
        }
      }
      Get.snackbar("Thêm", "Thêm thành công!!");

      listHiveBorrowed.clear();
    };
  }

  String? calLoanPreiod(String? dateTime) {
    if (dateTime == null) {
      return null;
    } else {
      final splitted = dateTime.split('/');
      int? month = int.parse(splitted[1]);
      int? year = int.parse(splitted[2]);
      if (month == 12) {
        year = year + 1;
        month = 1;
      } else {
        month++;
      }
      String? finalDay = "${splitted[0]}/$month/$year";
      return finalDay;
    }
  }

  void addLocalData() {
    listDocument.value = addBookUsecase.getAllListDocument();
  }

  void addDocumentBorrowed() {
    listBorrowed.value = addBookUsecase.getListBorrowedDocument();
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

  Future<void> addDocument(int index) async {
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
      addBookUsecase.updateDocument(
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
          isBorrowed: false,
        ),
        index,
      );
      addLocalData();
      clearData();
      Get.to(() => const MainScreen());
      Get.snackbar("Update tài liệu", "Update tài liệu thành công!!");
    }
  }
}
