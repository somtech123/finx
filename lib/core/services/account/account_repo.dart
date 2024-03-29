abstract class AccountRepository {
  createVirtualAccount(Map<String, dynamic> payload);

  getBalance();

  getAccountInfo({required String accountRef});

  fundAccount(Map<String, dynamic> payload);

  getTranscationHistory(Map<String, dynamic> payload);

  resolveBankAcct(Map<String, dynamic> payload);

  makeTransfer(Map<String, dynamic> payload);
}
