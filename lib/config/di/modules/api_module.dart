import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nav2_example/api/rest_api_client.dart';

@module
abstract class ApiModule {
  @lazySingleton
  Dio dio() {
    return Dio()
      ..options.sendTimeout = const Duration(microseconds: 50000)
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  @lazySingleton
  RestApiClient apiClient(Dio dio) => RestApiClient(dio);
}
