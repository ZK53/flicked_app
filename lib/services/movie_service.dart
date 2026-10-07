import 'package:flicked_app/services/dio_service.dart';
import 'package:get_it/get_it.dart';

class MovieService {
  final GetIt _getIt = GetIt.instance;
  late final DioService _dioService;

  MovieService(){
    _dioService = _getIt.get<DioService>();
  }
}