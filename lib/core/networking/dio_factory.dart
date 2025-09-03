import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = timeOut;
      dio!.options.receiveTimeout = timeOut;

      dio!.options.headers = {
        'Accept': 'application/json',
        'Authorization':
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzU2OTIxNzczLCJleHAiOjE3NTcwMDgxNzMsIm5iZiI6MTc1NjkyMTc3MywianRpIjoiSHl4QzVDc1MwMEtRVmdQYiIsInN1YiI6IjQyNjciLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.ZLCRPY5sPvjt83sotjVpWGCGqkC89GLxC3eeKGLCr2I",
      };

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        error: true,
        // requestHeader: true,
        // responseHeader: true,
      ),
    );
  }
}
