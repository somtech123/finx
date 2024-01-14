import 'package:dio/dio.dart';
import 'package:finx/core/api/endpoint.dart';
import 'package:finx/core/api/korapay_public_api.dart';
import 'package:finx/core/services/korapay_services/korapay_repo.dart';

class KoraPayRepoImplementation extends KoraPayRepository {
  final KoraPayPublicApi _api = KoraPayPublicApi(Dio());
  @override
  getAllBank(Map<String, dynamic> payload) async {
    try {
      return await _api.dio
          .get(Endpoints.getAllBanks, queryParameters: payload);
    } on DioError catch (e) {
      return _api.handleError(e);
    }
  }
}
