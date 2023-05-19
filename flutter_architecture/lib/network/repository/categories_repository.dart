import 'dart:async';

import 'package:flutter_architecture/network/model/category_list.dart';

import '../model/category_detail.dart';
import '../model/random_category.dart';
import '../remote/categories_remote_source.dart';

class CategoriesRepository {
  final CategoriesRemoteSource _remoteSource = CategoriesRemoteSource();

  Future<CategoryDetail> fetchCategoryDetail(String category) async {
    return await _remoteSource.getCategoriesDetail(category);
  }

  Future<RandomCategory> fetchRandomCategory() async {
    return await _remoteSource.getRandomCategory();
  }

  Future<CategoryList> fetchCategoryList() async {
    return await _remoteSource.getCategories();
  }
}
