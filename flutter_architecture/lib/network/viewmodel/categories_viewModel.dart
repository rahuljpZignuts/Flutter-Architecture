import 'package:flutter_architecture/network/model/category_list.dart';
import 'package:flutter_architecture/network/provider/stream_provider.dart';
import 'package:flutter_architecture/network/repository/categories_repository.dart';

import '../model/category_detail.dart';
import '../model/random_category.dart';

class CategoriesViewModel {
  final CategoriesRepository _categoryRepository = CategoriesRepository();

  final StreamProvider<CategoryList> categoryListStreamProvider =
      StreamProvider();
  final StreamProvider<CategoryDetail> categoryDetailStreamProvider =
      StreamProvider();
  final StreamProvider<RandomCategory> randomCategoryStreamProvider =
      StreamProvider();

  fetchCategoriesDetail(String category) async {
    categoryDetailStreamProvider
        .makeRequest(_categoryRepository.fetchCategoryDetail(category));
  }

  fetchRandomCategory() async {
    randomCategoryStreamProvider
        .makeRequest(_categoryRepository.fetchRandomCategory());
  }

  fetchCategories() async {
    categoryListStreamProvider
        .makeRequest(_categoryRepository.fetchCategoryList());
  }

  dispose() {
    categoryListStreamProvider.dispose();
    categoryDetailStreamProvider.dispose();
    randomCategoryStreamProvider.dispose();
  }
}
