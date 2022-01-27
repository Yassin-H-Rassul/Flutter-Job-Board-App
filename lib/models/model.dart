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

  ModelJob({
    this.id,
    this.title,
    this.category,
    this.companyName,
    this.hiers,
    this.salary,
    this.validDate,
    this.email,
  });

  factory ModelJob.fromMap(Map<String, dynamic> json) => ModelJob(
        id: json["id"],
        title: json["title"],
        category: json["category"],
        companyName: json["companyName"],
        hiers: json["hiers"],
        salary: json["salary"],
        validDate: json["validDate"],
        email: json["email"],
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
      };
}
