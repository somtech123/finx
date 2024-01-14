import 'package:dio/dio.dart';
import 'package:finx/core/api/api.dart';
import 'package:finx/core/api/endpoint.dart';
import 'package:finx/core/services/account/account_repo.dart';

class AccountRepoImplementation implements AccountRepository {
  final Api _api = Api(Dio());

  @override
  createVirtualAccount(Map<String, dynamic> payload) async {
    try {
      return await _api.dio.post(Endpoints.createVirtualAccount, data: payload);
    } on DioError catch (e) {
      return _api.handleError(e);
    }
  }

  @override
  getAccountInfo({required String accountRef}) async {
    try {
      return await _api.dio.get(Endpoints.getAcctDetail(accountRef));
    } on DioError catch (e) {
      return _api.handleError(e);
    }
  }

  @override
  getBalance() async {
    try {
      return await _api.dio.get(Endpoints.getBalance);
    } on DioError catch (e) {
      return _api.handleError(e);
    }
  }

  @override
  fundAccount(Map<String, dynamic> payload) async {
    try {
      return await _api.dio.post(Endpoints.fundAcct, data: payload);
    } on DioError catch (e) {
      return _api.handleError(e);
    }
  }

  @override
  getTranscationHistory(Map<String, dynamic> payload) async {
    try {
      return await _api.dio
          .get(Endpoints.getTransaction, queryParameters: payload);
    } on DioError catch (e) {
      return _api.handleError(e);
    }
  }

  @override
  resolveBankAcct(Map<String, dynamic> payload)async {
    try {
      return await _api.dio
          .post(Endpoints.resolveBank, data: payload);
    } on DioError catch (e) {
      return _api.handleError(e);
    }
  }
}
