class TransactionModel {
  String? totalAmountReceived;
  String? accountNumber;
  String? currency;
  List<Transaction>? transactions;

  TransactionModel({
    this.totalAmountReceived,
    this.accountNumber,
    this.currency,
    this.transactions,
  });

  factory TransactionModel.fromJson(Map<String?, dynamic> json) =>
      TransactionModel(
        totalAmountReceived: json["total_amount_received"].toString(),
        accountNumber: json["account_number"],
        currency: json["currency"],
        transactions: List<Transaction>.from(
            json["transactions"].map((x) => Transaction.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "total_amount_received": totalAmountReceived,
        "account_number": accountNumber,
        "currency": currency,
        "transactions":
            List<dynamic>.from(transactions!.map((x) => x.toJson())),
      };
}

class Transaction {
  String? reference;
  String? status;
  String? amount;
  String? fee;
  String? currency;
  String? description;
  PayerBankAccount? payerBankAccount;

  Transaction({
    this.reference,
    this.status,
    this.amount,
    this.fee,
    this.currency,
    this.description,
    this.payerBankAccount,
  });

  factory Transaction.fromJson(Map<String?, dynamic> json) => Transaction(
        reference: json["reference"],
        status: json["status"],
        amount: json["amount"],
        fee: json["fee"],
        currency: json["currency"],
        description: json["description"],
        payerBankAccount: PayerBankAccount.fromJson(json["payer_bank_account"]),
      );

  Map<String?, dynamic> toJson() => {
        "reference": reference,
        "status": status,
        "amount": amount,
        "fee": fee,
        "currency": currency,
        "description": description,
        "payer_bank_account": payerBankAccount!.toJson(),
      };
}

class PayerBankAccount {
  String? payerAccountName;
  String? payerAccountNumber;
  String? payerBank;

  PayerBankAccount({
    this.payerAccountName,
    this.payerAccountNumber,
    this.payerBank,
  });

  factory PayerBankAccount.fromJson(Map<String?, dynamic> json) =>
      PayerBankAccount(
        payerAccountName: json["payer_account_name"],
        payerAccountNumber: json["payer_account_number"],
        payerBank: json["payer_bank"],
      );

  Map<String?, dynamic> toJson() => {
        "payer_account_name": payerAccountName,
        "payer_account_number": payerAccountNumber,
        "payer_bank": payerBank,
      };
}
