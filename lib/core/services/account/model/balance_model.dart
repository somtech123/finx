class BalanceModel {
  Ghs? ghs;
  Ghs? kes;
  Ghs? ngn;
  Ghs? usd;

  BalanceModel({
    this.ghs,
    this.kes,
    this.ngn,
    this.usd,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        ghs: Ghs.fromJson(json["GHS"]),
        kes: Ghs.fromJson(json["KES"]),
        ngn: Ghs.fromJson(json["NGN"]),
        usd: Ghs.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "GHS": ghs!.toJson(),
        "KES": kes!.toJson(),
        "NGN": ngn!.toJson(),
        "USD": usd!.toJson(),
      };
}

class Ghs {
  String? pendingBalance;
  String? availableBalance;

  Ghs({
    this.pendingBalance,
    this.availableBalance,
  });

  factory Ghs.fromJson(Map<String, dynamic> json) => Ghs(
        pendingBalance: json["pending_balance"].toString(),
        availableBalance: json["available_balance"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "pending_balance": pendingBalance,
        "available_balance": availableBalance,
      };
}
