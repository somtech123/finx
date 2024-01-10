class UserModel {
  String? userName;
  String? id;
  String? profileImage;
  String? firstName;
  String? lastName;

  String? phone;
  String? email;
  DateTime? dateCreated;

  UserModel({
    this.userName,
    this.id,
    this.profileImage,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.dateCreated,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["userName"],
        id: json["uid"],
        profileImage: json["profileImage"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        dateCreated: DateTime.parse(json["dateCreated"]),
      );

  Map<String?, dynamic> toJson() => {
        "userName": userName,
        "id": id,
        "profileImage": profileImage,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "dateCreated": dateCreated!.toIso8601String(),
      };
}
