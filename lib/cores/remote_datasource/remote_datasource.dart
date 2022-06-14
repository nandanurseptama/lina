import 'package:dio/dio.dart';
import 'package:lina/cores/models/category_model.dart';
import 'package:lina/cores/models/detail_meal.dart';
import 'package:lina/cores/models/meal_model.dart';

class RemoteDataSource {
  final Dio dio = Dio();

  Future<List<CategoryModel>> getMealCategory() async {
    try {
      var response = await dio
          .get("https://www.themealdb.com/api/json/v1/1/categories.php");
      if (response.statusCode != 200) {
        throw RemoteDataSourceException(
            message: response.statusMessage ?? "unknown_error");
      }
      if (response.data == null) {
        return [];
      }
      var data = response.data;
      if (data['categories'] == null) {
        return [];
      }
      return (data['categories'] as List)
          .map((e) => CategoryModel.fromJson(json: e))
          .toList();
    } catch (e) {
      throw RemoteDataSourceException(message: e.toString());
    }
  }

  Future<List<MealModel>> getMealByCategory(
      {required String categoryName}) async {
    try {
      var response = await dio.get(
          "https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName");
      if (response.statusCode != 200) {
        throw RemoteDataSourceException(
            message: response.statusMessage ?? "unknown_error");
      }
      if (response.data == null) {
        return [];
      }
      var data = response.data;
      if (data['meals'] == null) {
        return [];
      }
      return (data['meals'] as List)
          .map((e) => MealModel.fromJson(json: e))
          .toList();
    } catch (e) {
      throw RemoteDataSourceException(message: e.toString());
    }
  }

  Future<DetailMeal?> getMealDetailById({required String id}) async {
    try {
      var response = await dio
          .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
      if (response.statusCode != 200) {
        throw RemoteDataSourceException(
            message: response.statusMessage ?? "unknown_error");
      }
      if (response.data == null) {
        return null;
      }
      var data = response.data;
      if (data['meals'] == null) {
        return null;
      }
      if ((data['meals']! as List).isEmpty) {
        return null;
      }
      return DetailMeal.fromJson(json: (data["meals"]! as List).first);
    } catch (e) {
      throw RemoteDataSourceException(message: e.toString());
    }
  }
}

class RemoteDataSourceException implements Exception {
  final String message;

  RemoteDataSourceException({required this.message});

  @override
  String toString() {
    return message;
  }
}
