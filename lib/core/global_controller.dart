import 'dart:io';

import 'package:finx/core/model/user_model.dart';
import 'package:finx/core/services/account/account_repo_implementation.dart';
import 'package:finx/core/services/account/model/account_info_model.dart';
import 'package:finx/core/services/account/model/balance_model.dart';
import 'package:finx/core/services/account/model/transcation_model.dart';
import 'package:finx/core/services/account/usecase.dart';
import 'package:finx/core/services/user_services/usecase.dart';
import 'package:finx/core/shared_widgets/alert_diaglog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final UserServices _userServices = UserServices();
  final AccountServices _accountServices =
      AccountServices(Get.put(AccountRepoImplementation()));

  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isFetching = false.obs;
  RxBool gettingBalance = false.obs;
  RxBool isFetchingAcctInfo = false.obs;

  Rx<UserModel> loginUser = UserModel().obs;

  Rx<AccountInfoModel> accountInfo = AccountInfoModel().obs;
  Rx<BalanceModel> balanceModel = BalanceModel().obs;
  Rx<TransactionModel> transcationModel = TransactionModel().obs;

  Future<bool> getUserInfo({bool? hasShimmer = true}) async {
    if (!hasShimmer!) {
      isFetching.value = true;
    } else {
      isFetching.value = false;
    }

    loginUser.value = await _userServices.getUserDetails();
    debugPrint(loginUser.value.toString());

    isFetching.value = true;
    return isFetching.value;
  }

  fetchBalance({bool? hasShimmer = true}) async {
    if (!hasShimmer!) {
      gettingBalance.value = true;
    } else {
      gettingBalance.value = false;
    }

    var res = await _accountServices.getBalance();
    gettingBalance.value = true;
    if (res.status!) {
      balanceModel.value = res.data;
    } else {
      showErrorAlertWidget(Get.context!, message: res.message);
    }
  }

  getAccountInfo() async {
    User? currentUser = _auth.currentUser;
    isFetchingAcctInfo.value = false;

    var res =
        await _accountServices.getAccountInfo(accountRef: currentUser!.uid);

    if (res.status!) {
      accountInfo.value = res.data;
      var _res = await _accountServices.getTranscationHistory(
          {'account_number': accountInfo.value.accountNumber});
      isFetchingAcctInfo.value = true;
      if (_res.status!) {
        transcationModel.value = _res.data;
      } else {
        showErrorAlertWidget(Get.context!, message: _res.message);
      }
    } else {
      showErrorAlertWidget(Get.context!, message: res.message);
    }
  }

  updateProfilePhoto(File file) async {
    String res = await _userServices.updateProfilePhoto(file);
    if (res == 'success') {
      getUserInfo(hasShimmer: false);
    } else {
      showErrorAlertWidget(Get.context!, message: res);
    }
  }
}
