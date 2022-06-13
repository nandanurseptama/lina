class MealModel {
  final String idMeal;
  final String mealName;
  final String mealImage;

  MealModel({
    required this.idMeal,
    required this.mealImage,
    required this.mealName,
  });

  factory MealModel.fromJson({required Map<String, dynamic> json}) {
    return MealModel(
        idMeal: json['idMeal'] ?? "",
        mealImage: json['strMealThumb'] ?? "",
        mealName: json['strMeal'] ?? "");
  }
}
