import 'package:library_management_system/domain/models/account_model.dart';

class User {
  Account? account;
  String? nameDocument;
  String? loanPeriod;
  User({
    this.account,
    this.loanPeriod,
    this.nameDocument,
  });
  User.fromJson(Map<String, dynamic> json) {
    nameDocument = json['nameDocument'];
    loanPeriod = json['loanPeriod'];
    account = json['account'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['nameDocument'] = nameDocument;
    data['loanPeriod'] = loanPeriod;
    data['account'] = account;
    return data;
  }
}
