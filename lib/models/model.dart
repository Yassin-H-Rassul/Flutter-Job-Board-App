class ModelJob {
  String? id;
  String? title;
  String? category;
  String? companyName;
  String? description;
  String? hiers;
  String? salary;
  DateTime? validDate;
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
      this.numberOfLikes,
      this.numberOfViews});

  factory ModelJob.fromMap(Map<String, dynamic> json) => ModelJob(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        companyName: json["companyName"],
        hiers: json["hiers"],
        salary: json["salary"],
        validDate: json["validDate"],
        email: json["email"],
        numberOfLikes: json["numberOfLikes"],
        numberOfViews: json["numberOfViews"],
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
        "numberOfLikes": numberOfLikes,
        "numberOfViews": numberOfViews,
      };
}
