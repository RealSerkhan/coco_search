import 'package:coco_search/config/dio_provider.dart';
import 'package:coco_search/infrastructure/models/results.dart';
import 'package:dio/dio.dart';

class SearchService {
  Future<RestClientResponse> search(
    FormData formData,
  ) async {
    final data = await HttpClientProvider.getInstance.client
        .post('coco-dataset-bigquery',
            data: formData,
            options: Options(headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            }));
    return RestClientResponse(
        headers: data.headers.map,
        body: data.data,
        statusCode: data.statusCode!);
  }
}
