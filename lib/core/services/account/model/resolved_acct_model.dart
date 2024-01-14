class ResolvedAcctModel {
  String? bankName;
  String? bankCode;
  String? accountNumber;
  String? accountName;

  ResolvedAcctModel({
    this.bankName,
    this.bankCode,
    this.accountNumber,
    this.accountName,
  });

  factory ResolvedAcctModel.fromJson(Map<String?, dynamic> json) =>
      ResolvedAcctModel(
        bankName: json["bank_name"],
        bankCode: json["bank_code"],
        accountNumber: json["account_number"],
        accountName: json["account_name"],
      );

  Map<String?, dynamic> toJson() => {
        "bank_name": bankName,
        "bank_code": bankCode,
        "account_number": accountNumber,
        "account_name": accountName,
      };
}
