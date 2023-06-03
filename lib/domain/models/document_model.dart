class Document {
  String? code;
  String? name;
  String? author;
  String? category;
  String? publisher;
  String? yearPublication;
  String? description;
  int? numberOfPage;
  String? paperSize;
  String? reprint;
  int? numberOfEditions;
  DateTime? releaseDate;
  DateTime? updateDate;

  Document({
    this.code,
    this.name,
    this.author,
    this.category,
    this.publisher,
    this.yearPublication,
    this.description,
    this.numberOfPage,
    this.paperSize,
    this.reprint,
    this.numberOfEditions,
    this.releaseDate,
    this.updateDate,
  });
  Document.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    author = json['author'];
    category = json['category'];
    publisher = json['publisher'];
    yearPublication = json['yearPublication'];
    description = json['description'];
    numberOfPage = json['numberOfPage'];
    paperSize = json['paperSize'];
    reprint = json['reprint'];
    numberOfEditions = json['numberOfEditions'];
    releaseDate = json['releaseDate'];
    updateDate = json['updateDate'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['author'] = author;
    data['category'] = category;
    data['publisher'] = publisher;
    data['yearPublication'] = yearPublication;
    data['description'] = description;
    data['numberOfPage'] = numberOfPage;
    data['paperSize'] = paperSize;
    data['reprint'] = reprint;
    data['numberOfEditions'] = numberOfEditions;
    data['releaseDate'] = releaseDate;
    data['updateDate'] = updateDate;
    return data;
  }
}
