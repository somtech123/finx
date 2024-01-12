class AccountInfoModel {
  String? accountName;
  String? accountNumber;
  String? accountStatus;
  String? accountReference;
  String? uniqueId;
  String? bankName;
  String? bankCode;
  String? currency;
  DateTime? createdAt;
  Customer? customer;

  AccountInfoModel({
    this.accountName,
    this.accountNumber,
    this.accountStatus,
    this.accountReference,
    this.uniqueId,
    this.bankName,
    this.bankCode,
    this.currency,
    this.createdAt,
    this.customer,
  });

  factory AccountInfoModel.fromJson(Map<String?, dynamic> json) =>
      AccountInfoModel(
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        accountStatus: json["account_status"],
        accountReference: json["account_reference"],
        uniqueId: json["unique_id"],
        bankName: json["bank_name"],
        bankCode: json["bank_code"],
        currency: json["currency"],
        createdAt: DateTime.parse(json["created_at"]),
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String?, dynamic> toJson() => {
        "account_name": accountName,
        "account_number": accountNumber,
        "account_status": accountStatus,
        "account_reference": accountReference,
        "unique_id": uniqueId,
        "bank_name": bankName,
        "bank_code": bankCode,
        "currency": currency,
        "created_at": createdAt!.toIso8601String(),
        "customer": customer!.toJson(),
      };
}

class Customer {
  String? name;
  String? email;

  Customer({
    this.name,
    this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
