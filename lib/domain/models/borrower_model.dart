import 'package:library_management_system/domain/models/user_model.dart';

class Borrower {
  String? codeUser;
  String? email;
  String? nameUser;
  List<BorrowedDocument>? borrowedDocument;
  Borrower({
    this.codeUser,
    this.email,
    this.nameUser,
    this.borrowedDocument,
  });

  Borrower.fromJson(Map<String, dynamic> json) {
    codeUser = json['codeUser'];
    email = json['email'];
    nameUser = json['nameUser'];
    if (json['borrowedDocument'] != null) {
      borrowedDocument = <BorrowedDocument>[];
      json['borrowedDocument'].forEach((v) {
        borrowedDocument?.add(BorrowedDocument.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['codeUser'] = codeUser;
    data['nameUser'] = nameUser;
    data['email'] = email;
    if (borrowedDocument != null) {
      data['borrowedDocument'] = borrowedDocument?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class BorrowedDocument {
  String? idDocument;
  String? nameDocument;
  String? loanPeriod;
  BorrowedDocument({
    this.idDocument,
    this.nameDocument,
    this.loanPeriod,
  });

  BorrowedDocument.fromJson(Map<String, dynamic> json) {
    idDocument = json['idDocument'];
    nameDocument = json['nameDocument'];
    loanPeriod = json['loanPeriod'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['idDocument'] = idDocument;
    data['nameDocument'] = nameDocument;
    data['loanPeriod'] = loanPeriod;
    return data;
  }
}
