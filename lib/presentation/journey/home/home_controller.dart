import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class HomeController extends GetxController {
  final List<Document> listDocument = [
    Document(
        name: "Kinh tế chính trị Mác-Lênin",
        author: "Võ Văn Thưởng",
        category: "Giáo Trình",
        code: "abcd1",
        description: "Truyện kể về 1 nhân vật abcxyz",
        numberOfEditions: 10,
        numberOfPage: 300,
        paperSize: "A4",
        publisher: "Truyện CV",
        releaseDate: DateTime.now(),
        reprint: "Lần 3",
        updateDate: DateTime.now(),
        language: "English"),
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
        language: "English"),
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
        language: "English"),
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
        language: "English")
  ];
  final tabs = <Widget>[
    Text(
      "Giáo trình",
      textAlign: TextAlign.center,
      style: ThemeText.heading3,
    ),
    Text(
      "Tiểu thuyết",
      textAlign: TextAlign.center,
      style: ThemeText.heading3,
    ),
    Text(
      "Truyện tranh",
      textAlign: TextAlign.center,
      style: ThemeText.heading3,
    ),
  ];
}
