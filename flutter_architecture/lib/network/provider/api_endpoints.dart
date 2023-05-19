class ApiEndpoints {
  static const String _baseUrl = "https://api.chucknorris.io/";
  static const String _getRandomCategory = "jokes/random";
  static const String _getCategoryList = "jokes/categories";

  static String getCategoryDetail() {
    return _baseUrl + _getRandomCategory;
  }

  static String getRandomCategory() {
    return _baseUrl + _getRandomCategory;
  }

  static String getCategoryList() {
    return _baseUrl + _getCategoryList;
  }
}
