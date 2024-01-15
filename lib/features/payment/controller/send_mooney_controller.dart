import 'dart:math';

import 'package:finx/core/global_controller.dart';
import 'package:finx/core/helper/encryption_helper.dart';
import 'package:finx/core/services/account/account_repo_implementation.dart';
import 'package:finx/core/services/account/model/resolved_acct_model.dart';
import 'package:finx/core/services/account/usecase.dart';
import 'package:finx/core/services/korapay_services/korapay_repo_implementation.dart';
import 'package:finx/core/services/korapay_services/model/bank_model.dart';
import 'package:finx/core/services/korapay_services/usecase.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/shared_widgets/loading_widget.dart';
import 'package:finx/features/payment/screen/tran_success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendMoneyController extends GetxController {
  final KoraPayServices _koraPayServices =
      KoraPayServices(Get.put(KoraPayRepoImplementation()));

  final AccountServices _accountServices =
      AccountServices(Get.put(AccountRepoImplementation()));

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var globalCtr = Get.find<GlobalController>();

  RxBool isFetching = false.obs;

  RxBool resolvingAcct = false.obs;

  RxBool isTyping = true.obs;

  RxString pinErrorText = ''.obs;

  RxString status = ''.obs;

  RxList<BankModel> bankList = <BankModel>[].obs;

  ResolvedAcctModel resolveAcct = ResolvedAcctModel();

  var selectedBank = BankModel(code: '', name: '').obs;

  var acctNumberCtr = TextEditingController();
  var amtCtr = TextEditingController();
  var descriptionController = TextEditingController();

  final _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

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

  Map<String, dynamic> payload() => {
        "reference": _generateReference(),
        //_auth.currentUser!.uid,
        "destination": {
          "type": "bank_account",
          "amount": amtCtr.text.replaceAll(',', ''),
          "currency": "NGN",
          "narration": descriptionController.text,
          "bank_account": {
            "bank": resolveAcct.bankCode,
            "account": resolveAcct.accountNumber
          },
          "customer": {
            "name": globalCtr.accountInfo.value.accountName,
            "email": _auth.currentUser!.email
          }
        }
      };

  _makeTransfer() async {
    showLoading(Get.context!);

    var res = await _accountServices.makeTransfer(payload());

    Get.back();
    if (res.status!) {
      Get.to(
        () => const TransactionSuccessScreen(
          successText: "Transfer initiated successfully",
        ),
      );
    } else {
      showErrorAlertWidget(Get.context!, message: res.message);
    }
  }

  String _generateReference() {
    var randomPart =
        List.generate(16, (index) => _chars[Random().nextInt(_chars.length)])
            .join();
    var timestampPart =
        DateTime.now().millisecondsSinceEpoch.toString().substring(0, 8);
    return 'KPY-PAY-$randomPart-$timestampPart';
  }

  validateWallet(String enteredPin) async {
    pinErrorText.value = '';
    String cipher = globalCtr.walletData.value.wallet!;

    String pin = await EncryptionHelper.decryptKey(cipher);

    if (enteredPin != pin) {
      pinErrorText.value = 'Invalid pin';
    } else {
      await _makeTransfer();
    }
  }

  @override
  void onReady() {
    getAllBank();
    super.onReady();
  }
}
