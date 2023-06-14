class Account {
  String? code;
  String? name;
  String? password;
  String? email;
  bool? isLogin;
  Account({
    this.code,
    this.name,
    this.password,
    this.email,
    this.isLogin,
  });
  Account.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['isLogin'] = isLogin;
    return data;
  }
}
