class WalletModel {
  String? wallet;
  WalletModel({this.wallet});

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      WalletModel(wallet: json['pin']);

  WalletModel copyWith({String? wallet}) =>
      WalletModel(wallet: wallet ?? this.wallet);
}
