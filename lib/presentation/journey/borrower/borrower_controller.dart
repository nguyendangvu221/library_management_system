import 'package:get/get.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';

class BorrowerController extends GetxController {
  List<Borrower> listBorrower = [
    Borrower(
      codeUser: "CT050456",
      email: "CT050456@actvn.edu.vn",
      nameUser: "Nguyễn Đăng Vũ",
      borrowedDocument: [
        BorrowedDocument(
          idDocument: "KMAKTCT",
          loanPeriod: "16/01/2023",
          nameDocument: "Kinh tế chính trị Mác- Lênin",
        ),
        BorrowedDocument(
          idDocument: "KMAKTCT",
          loanPeriod: "16/01/2023",
          nameDocument: "Kinh tế chính trị Mác- Lênin",
        ),
      ],
    ),
    Borrower(
      codeUser: "CT050455",
      email: "CT050455@actvn.edu.vn",
      nameUser: "Phan Hữu Việt",
      borrowedDocument: [
        BorrowedDocument(
          idDocument: "KMATCC1",
          loanPeriod: "16/01/2023",
          nameDocument: "Toán cao cấp 1",
        ),
        // BorrowedDocument(
        //   idDocument: "KMAKTCT",
        //   loanPeriod: "16/01/2023",
        //   nameDocument: "Kinh tế chính trị Mác- Lênin",
        // ),
        BorrowedDocument(
          idDocument: "KMAVLDC1",
          loanPeriod: "16/01/2023",
          nameDocument: "Vật lý đại cương 1",
        ),
      ],
    ),
    Borrower(
      codeUser: "CT050442",
      email: "CT050442@actvn.edu.vn",
      nameUser: "Hoàng Trọng Tấn",
      borrowedDocument: [
        BorrowedDocument(
          idDocument: "KMAKTCT",
          loanPeriod: "16/01/2023",
          nameDocument: "Kinh tế chính trị Mác- Lênin",
        ),
        BorrowedDocument(
          idDocument: "KMAKTCT",
          loanPeriod: "16/01/2023",
          nameDocument: "Kinh tế chính trị Mác- Lênin",
        ),
        // BorrowedDocument(
        //   idDocument: "KMAKTCT",
        //   loanPeriod: "16/01/2023",
        //   nameDocument: "Kinh tế chính trị Mác- Lênin",
        // ),
      ],
    ),
    Borrower(
      codeUser: "CT050456",
      email: "CT050456@actvn.edu.vn",
      nameUser: "Nguyễn Đăng Vũ",
      borrowedDocument: [
        BorrowedDocument(
          idDocument: "KMAKTCT",
          loanPeriod: "16/01/2023",
          nameDocument: "Kinh tế chính trị Mác- Lênin",
        ),
        BorrowedDocument(
          idDocument: "KMAKTCT",
          loanPeriod: "16/01/2023",
          nameDocument: "Kinh tế chính trị Mác- Lênin",
        ),
        // BorrowedDocument(
        //   idDocument: "KMAKTCT",
        //   loanPeriod: "16/01/2023",
        //   nameDocument: "Kinh tế chính trị Mác- Lênin",
        // ),
      ],
    ),
  ].obs;
}
