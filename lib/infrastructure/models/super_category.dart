class SuperCategory {
  SuperCategory({this.supercategory, this.id, this.name});
  String? supercategory;
  int? id;
  String? name;
  factory SuperCategory.fromJson(Map<String, dynamic> json) {
    return SuperCategory(
        name: json['name'],
        id: json['id'],
        supercategory: json['supercategory']);
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "supercategory": supercategory,
      };
}
