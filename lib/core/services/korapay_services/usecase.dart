import 'package:dio/dio.dart';
import 'package:finx/core/api/api_response_model.dart';
import 'package:finx/core/services/korapay_services/korapay_repo_implementation.dart';
import 'package:finx/core/services/korapay_services/model/bank_model.dart';
import 'package:flutter/material.dart';

class KoraPayServices {
  final KoraPayRepoImplementation koraPayRepoImplementation;

  KoraPayServices(this.koraPayRepoImplementation);

  Future<ResponseModel<List<BankModel>>> getAllBank(Map<String, dynamic> payload) async {
    Response response = await koraPayRepoImplementation.getAllBank(payload);
    int statusCode = response.statusCode ?? 000;
    debugPrint(
        'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDstatus: [INFO] ${response.statusCode}');
    debugPrint('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDdata: [INFO] ${response.data}');

    if (statusCode >= 200 && statusCode <= 300) {
      return ResponseModel(
        status: true,
        message: response.statusMessage,
        data: List<BankModel>.from(
            response.data["data"].map((x) => BankModel.fromJson(x))),
      );
    }

    return ResponseModel(
      status: false,
      message: response.statusMessage,
    );
  }
}
