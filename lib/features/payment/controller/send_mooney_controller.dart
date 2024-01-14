import 'package:finx/core/services/account/account_repo_implementation.dart';
import 'package:finx/core/services/account/model/resolved_acct_model.dart';
import 'package:finx/core/services/account/usecase.dart';
import 'package:finx/core/services/korapay_services/korapay_repo_implementation.dart';
import 'package:finx/core/services/korapay_services/model/bank_model.dart';
import 'package:finx/core/services/korapay_services/usecase.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendMoneyController extends GetxController {
  final KoraPayServices _koraPayServices =
      KoraPayServices(Get.put(KoraPayRepoImplementation()));

  final AccountServices _accountServices =
      AccountServices(Get.put(AccountRepoImplementation()));

  RxBool isFetching = false.obs;

  RxBool resolvingAcct = false.obs;

  RxBool isTyping = true.obs;

  RxString status = ''.obs;

  RxList<BankModel> bankList = <BankModel>[].obs;

  ResolvedAcctModel resolveAcct = ResolvedAcctModel();

  var selectedBank = BankModel(code: '', name: '').obs;

  var acctNumberCtr = TextEditingController();
  var amtCtr = TextEditingController();
  var descriptionController = TextEditingController();

  getAllBank() async {
    isFetching.value = false;

    var res = await _koraPayServices.getAllBank({'countryCode': 'NG'});

    isFetching.value = true;

    if (res.status!) {
      bankList.value = res.data;
      selectedBank.value = bankList.first;
    } else {
      showErrorAlertWidget(Get.context!, message: res.message);
    }
  }

  onAcctChange(String acct) async {
    isTyping.value = true;

    if (acct.length == 10) {
      await _resolveAcct(acct);
    }
  }

  _resolveAcct(String acct) async {
    isTyping.value = false;

    status.value = '';
    resolveAcct.accountName = '';

    resolvingAcct.value = false;
    var res = await _accountServices.resolveBankAcct(
        {"bank": selectedBank.value.code, "account": acct, "currency": "NGN"});
    status.value = res.message!;

    resolvingAcct.value = true;

    if (res.status!) {
      resolveAcct = res.data;
    } else {}
  }

  @override
  void onReady() {
    getAllBank();
    super.onReady();
  }
}
