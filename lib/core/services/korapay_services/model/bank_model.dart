class BankModel {
  String? name;
  String? slug;
  String? code;
  String? nibssBankCode;
  String? country;

  BankModel({
    this.name,
    this.slug,
    this.code,
    this.nibssBankCode,
    this.country,
  });

  factory BankModel.fromJson(Map<String?, dynamic> json) => BankModel(
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        nibssBankCode: json["nibss_bank_code"],
        country: json["country"],
      );

  Map<String?, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "code": code,
        "nibss_bank_code": nibssBankCode,
        "country": country
      };
}
