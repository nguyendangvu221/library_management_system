class User {
  String? code;
  String? name;
  String? age;
  String? gender;
  String? jobTitle;
  String? email;
  String? numberPhone;

  User({
    this.code,
    this.name,
    this.age,
    this.gender,
    this.jobTitle,
    this.email,
    this.numberPhone,
  });
  User.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    jobTitle = json['jobTitle'];
    email = json['email'];
    numberPhone = json['numberPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['jobTitle'] = jobTitle;
    data['email'] = email;
    data['numberPhone'] = numberPhone;
    return data;
  }
}
