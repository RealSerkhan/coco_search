import 'package:coco_search/infrastructure/services/search.service.dart';
import 'package:dio/dio.dart';

class SearchRepository {
  final SearchService _searchService = SearchService();
  getImagesId(List<int> ids) async {
    FormData formData = FormData();

    ids.forEach((id) {
      formData.fields.add(MapEntry('category_ids', '$id'));
    });
    formData.fields.add(MapEntry('querytype', 'getImagesByCats'));
    final result = await _searchService.search(formData);
  }
}
