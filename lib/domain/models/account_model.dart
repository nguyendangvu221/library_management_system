class Account {
  String? code;
  String? name;
  String? password;
  String? email;

  Account({
    this.code,
    this.name,
    this.password,
    this.email,
  });
  Account.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
