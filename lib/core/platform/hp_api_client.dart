import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IHPApiClient {
  late final Dio dio;
}

class HPApiClient implements IHPApiClient {
  @override
  late final Dio dio;
  HPApiClient() {
    dio = Dio(BaseOptions(baseUrl: dotenv.env['URL_BASE']!));
  }
}
