import 'package:dio/dio.dart';
import 'package:finx/core/api/api_response_model.dart';
import 'package:finx/core/services/account/account_repo_implementation.dart';
import 'package:finx/core/services/account/model/account_info_model.dart';
import 'package:finx/core/services/account/model/balance_model.dart';
import 'package:finx/core/services/account/model/transcation_model.dart';
import 'package:flutter/material.dart';

class AccountServices {
  final AccountRepoImplementation accountRepoImplementation;
  AccountServices(this.accountRepoImplementation);

//creates users virtual account upon registration of an account
  Future<ResponseModel> createVirtualAccount(
      Map<String, dynamic> payload) async {
    Response response =
        await accountRepoImplementation.createVirtualAccount(payload);
    int statusCode = response.statusCode ?? 000;
    debugPrint(
        'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDstatus: [INFO] ${response.statusCode}');
    debugPrint('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDdata: [INFO] ${response.data}');

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
        status: true,
        message: response.statusMessage,
        data: response.data,
      );
    }

    return ResponseModel(
      status: false,
      message: response.statusMessage,
    );
  }

  //funding of account to the korapay api using sandbox

  Future<ResponseModel> fundAcct(Map<String, dynamic> payload) async {
    Response response = await accountRepoImplementation.fundAccount(payload);
    int statusCode = response.statusCode ?? 000;
    debugPrint(
        'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDstatus: [INFO] ${response.statusCode}');
    debugPrint('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDdata: [INFO] ${response.data}');

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
        status: true,
        message: response.statusMessage,
        data: response.data,
      );
    }

    return ResponseModel(
      status: false,
      message: response.statusMessage,
    );
  }

  //get account info

  Future<ResponseModel<AccountInfoModel>> getAccountInfo(
      {required String accountRef}) async {
    Response response =
        await accountRepoImplementation.getAccountInfo(accountRef: accountRef);
    int statusCode = response.statusCode ?? 000;
    debugPrint(
        'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDstatus: [INFO] ${response.statusCode}');
    debugPrint('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDdata: [INFO] ${response.data}');

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
        status: true,
        message: response.statusMessage,
        data: AccountInfoModel.fromJson(response.data["data"]),
      );
    }

    return ResponseModel(
      status: false,
      message: response.statusMessage,
    );
  }
  //get account / wallet balance

  Future<ResponseModel<BalanceModel>> getBalance() async {
    Response response = await accountRepoImplementation.getBalance();
    int statusCode = response.statusCode ?? 000;
    debugPrint(
        'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDstatus: [INFO] ${response.statusCode}');
    debugPrint('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDdata: [INFO] ${response.data}');

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
        status: true,
        message: response.statusMessage,
        data: BalanceModel.fromJson(response.data["data"]),
      );
    }

    return ResponseModel(
      status: false,
      message: response.statusMessage,
    );
  }

  Future<ResponseModel<TransactionModel>> getTranscationHistory(
      Map<String, dynamic> payload) async {
    Response response =
        await accountRepoImplementation.getTranscationHistory(payload);
    int statusCode = response.statusCode ?? 000;
    debugPrint(
        'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDstatus: [INFO] ${response.statusCode}');
    debugPrint('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDdata: [INFO] ${response.data}');

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
        status: true,
        message: response.statusMessage,
        data: TransactionModel.fromJson(response.data["data"]),
      );
    }

    return ResponseModel(
      status: false,
      message: response.statusMessage,
    );
  }
}
