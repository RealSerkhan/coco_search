import 'package:coco_search/infrastructure/models/super_category.dart';
import 'package:coco_search/screens/search/data/repository.dart';
import 'package:flutter/material.dart';

class SearchState extends ChangeNotifier {
  SearchRepository _repository = SearchRepository();
  SearchState();
  List<SuperCategory> selectedSubCategories = [];
  search() {
    _repository.getImagesId(selectedSubCategories.map((e) => e.id!).toList());
    return;
  }
}
