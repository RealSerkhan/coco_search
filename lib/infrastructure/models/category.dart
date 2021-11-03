import 'package:coco_search/infrastructure/models/super_category.dart';

class Category {
  Category({required this.name, required this.subCategories});
  String name;
  List<SuperCategory> subCategories;
}
