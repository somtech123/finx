class Endpoints {
  static const baseUrl = 'https://api.korapay.com';
  static const createVirtualAccount = '/merchant/api/v1/virtual-bank-account';
  static getAcctDetail(String acctRef) =>
      '/merchant/api/v1/virtual-bank-account/$acctRef';
  static const getBalance = '/merchant/api/v1/balances';
  static const fundAcct =
      '/merchant/api/v1/virtual-bank-account/sandbox/credit';
  static const getTransaction =
      '/merchant/api/v1/virtual-bank-account/transactions';
}
