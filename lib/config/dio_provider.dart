import 'package:coco_search/core/constants.dart';
import 'package:dio/dio.dart';

class HttpClientProvider implements IHttpClientProvider {
  var client = Dio(BaseOptions(
    baseUrl: BASE_URL,
  ));
  static HttpClientProvider? _instance;

  HttpClientProvider._();

  static HttpClientProvider get getInstance =>
      _instance = _instance ?? HttpClientProvider._();

  HttpClientProvider() {
    client.options.baseUrl = BASE_URL;

    client.interceptors.addAll([
      InterceptorsWrapper(onError: (err, errHandler) async {
        print('ERROR happened ' + err.message);
        print('ERROR happened ' + err.requestOptions.path);

        return errHandler.resolve(err.response!);
      })
    ]);
  }

  @override
  Dio getHttpClient() {
    return client;
  }

  @override
  void allowHeaders() {
    client.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // var token = preferencesService.getString('TOKEN');
      // var customHeaders = {'Authorization': 'Bearer $token'};
      // print(token);
      // options.headers.addAll(customHeaders);
      return handler.next(options);
    }));
  }
}

class IHttpClientProvider {
  Dio? getHttpClient() {}

  void allowHeaders() {}
}
