import 'package:cloud_firestore/cloud_firestore.dart';

class ModelJob {
  String? id;
  String? title;
  String? category;
  String? companyName;
  String? description;
  String? hiers;
  String? salary;
  bool? isFav;
  Timestamp? validDate;
  String? email;
  int? numberOfLikes;
  int? numberOfViews;

  ModelJob(
      {this.id,
      this.title,
      this.category,
      this.companyName,
      this.hiers,
      this.salary,
      this.validDate,
      this.email,
      this.isFav,
      this.numberOfLikes,
      this.numberOfViews,
      this.description});

  factory ModelJob.fromMap(Map<String, dynamic> json) => ModelJob(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        companyName: json["companyName"],
        hiers: json["hiers"],
        salary: json["salary"],
        validDate: json["validDate"],
        email: json["email"],
        isFav: json["isFav"],
        numberOfLikes: json["numberOfLikes"],
        numberOfViews: json["numberOfViews"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "category": category,
        "companyName": email,
        "hiers": hiers,
        "salary": salary,
        "validDate": validDate,
        "email": email,
        "isFav": isFav,
        "numberOfLikes": numberOfLikes,
        "numberOfViews": numberOfViews,
        "description": description,
      };
}
