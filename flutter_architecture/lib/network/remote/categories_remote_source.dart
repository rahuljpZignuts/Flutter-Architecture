import 'package:flutter_architecture/network/model/category_list.dart';
import 'package:flutter_architecture/network/provider/api_endpoints.dart';
import 'package:flutter_architecture/network/provider/network_executor.dart';

import '../../utils/shared_preferences.dart';
import '../model/category_detail.dart';
import '../model/random_category.dart';

class CategoriesRemoteSource {
  Future<CategoryDetail> getCategoriesDetail(String category) async {
    return CategoryDetail.fromJson(await NetworkExecutor.execute(
        ApiEndpoints.getCategoryDetail(), RestType.get,
        params: {"category": category}));
  }

  Future<RandomCategory> getRandomCategory() async {
    RandomCategory category = RandomCategory.fromJson(
        await NetworkExecutor.execute(
            ApiEndpoints.getRandomCategory(), RestType.get));
    SharedPreferencesUtils.saveToken(category.id ?? "");
    return category;
  }

  Future<CategoryList> getCategories() async {
    return CategoryList.fromJson(await NetworkExecutor.execute(
        ApiEndpoints.getCategoryList(), RestType.get));
  }
}
