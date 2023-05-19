class CategoryList {
  List<String>? categories;

  CategoryList({this.categories});

  CategoryList.fromJson(dynamic json) {
    categories = json.cast<String>();
  }
}
