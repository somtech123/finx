import 'package:finx/core/global_controller.dart';
import 'package:finx/core/services/account/account_repo_implementation.dart';
import 'package:finx/core/services/account/usecase.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:finx/core/shared_widgets/loading_widget.dart';
import 'package:finx/features/payment/screen/tran_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FundWalletController extends GetxController {
  final AccountServices _accountServices =
      AccountServices(Get.put(AccountRepoImplementation()));

  var globalCtr = Get.find<GlobalController>();

  var acctNumberCtr = TextEditingController();

  var amountCtr = TextEditingController();

  Map<String, dynamic> payload() => {
        "account_number": acctNumberCtr.text,
        "amount": amountCtr.text.replaceAll(',', ''),
        "currency": "NGN"
      };

  fundAcct() async {
    showLoading(Get.context!);
    var res = await _accountServices.fundAcct(payload());

    Get.back();

    if (res.status!) {
      // globalCtr.fetchBalance(hasShimmer: false);
      Get.to(() => const TransactionSuccessScreen(
            successText: "Transfer initiated successfully",
          ));
    } else {
      showErrorAlertWidget(Get.context!, message: res.message);
    }
  }

  @override
  void onReady() {
    acctNumberCtr.text = globalCtr.accountInfo.value.accountNumber!;
    super.onReady();
  }
}
