import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flicked_app/models/app_config.dart';
import 'package:get_it/get_it.dart';

class DioService {
  final Dio _dio = Dio();

  final GetIt _getIt = GetIt.instance;
  late String _baseUrl;
  late String _apiKey;

  DioService() {
    AppConfig config = _getIt.get<AppConfig>();
    _baseUrl = config.BASE_API_URL!;
    _apiKey = config.API_KEY!;
    _dio.options.baseUrl = _baseUrl;
  }

  Future<Either<String, Response>> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Map<String, dynamic> _queryParams = {
        'api_key': _apiKey,
        'language': 'en-US',
      };
      if (queryParams != null) {
        _queryParams.addAll(queryParams);
      }

      return right(await _dio.get(endpoint, queryParameters: _queryParams));
    } catch (e) {
      return left(handleException(e));
    }
  }

  String handleException(Object e) {
    String errorMsg;
    if (e is DioException) {
      if (e.response?.data != null) {
        var response = e.response?.data as Map<String, dynamic>;
        errorMsg = response['status_message'];
      } else {
        errorMsg = "Network error happened, try again later";
      }
    } else {
      errorMsg = "Error happened, try agian later";
    }
    return errorMsg;
  }
}
