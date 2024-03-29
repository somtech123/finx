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
  static const getAllBanks = '/merchant/api/v1/misc/banks';
  static const resolveBank = '/merchant/api/v1/misc/banks/resolve';
  static const Maketransfer = '/merchant/api/v1/transactions/disburse';
}
