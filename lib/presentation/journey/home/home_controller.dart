import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class HomeController extends GetxController {
  final List<Document> listDocument = [
    Document(
        name: "Tối cường trang bức đả kiểm hệ thống",
        author: "Trạch Trư",
        category: "Truyện tu tiên",
        code: "abcd1",
        description: "Truyện kể về 1 nhân vật abcxyz",
        numberOfEditions: 10,
        numberOfPage: 1500,
        paperSize: "A4",
        publisher: "Truyện CV",
        releaseDate: DateTime.now(),
        reprint: "Lần 3",
        updateDate: DateTime.now(),
        yearPublication: "2020"),
    Document(
        name: "Mục thần ký",
        author: "Trạch Trư",
        category: "Truyện tu tiên",
        code: "abcd1",
        description: "Truyện kể về 1 nhân vật abcxyz",
        numberOfEditions: 10,
        numberOfPage: 1500,
        paperSize: "A4",
        publisher: "Truyện CV",
        releaseDate: DateTime.now(),
        reprint: "Lần 3",
        updateDate: DateTime.now(),
        yearPublication: "2020"),
    Document(
        name: "Mục thần ký",
        author: "Trạch Trư",
        category: "Truyện tu tiên",
        code: "abcd1",
        description: "Truyện kể về 1 nhân vật abcxyz",
        numberOfEditions: 10,
        numberOfPage: 1500,
        paperSize: "A4",
        publisher: "Truyện CV",
        releaseDate: DateTime.now(),
        reprint: "Lần 3",
        updateDate: DateTime.now(),
        yearPublication: "2020"),
    Document(
        name: "Mục thần ký",
        author: "Trạch Trư",
        category: "Truyện tu tiên",
        code: "abcd1",
        description: "Truyện kể về 1 nhân vật abcxyz",
        numberOfEditions: 10,
        numberOfPage: 1500,
        paperSize: "A4",
        publisher: "Truyện CV",
        releaseDate: DateTime.now(),
        reprint: "Lần 3",
        updateDate: DateTime.now(),
        yearPublication: "2020")
  ];
  final tabs = <Widget>[
    Text(
      "Tab 1",
      style: ThemeText.heading3,
    ),
    Text(
      "Tab 2",
      style: ThemeText.heading3,
    ),
    Text(
      "Tab 3",
      style: ThemeText.heading3,
    ),
  ];
}
