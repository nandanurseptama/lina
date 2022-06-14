class DetailMeal {
  final String instructions;
  final String area;
  final String category;

  final List<String> ingredients;
  final List<String> measures;

  DetailMeal({
    required this.ingredients,
    required this.area,
    required this.category,
    required this.instructions,
    required this.measures,
  });

  factory DetailMeal.fromJson({required Map<String, dynamic> json}) {
    List<String> ings = List<String>.empty(growable: true);
    List<String> measure = List<String>.empty(growable: true);
    json.forEach((key, value) {
      if (key.startsWith("strIngredient") && value != null) {
        ings.add(value ?? "");
      }
      if (key.startsWith("strMeasure") && value != null) {
        measure.add(value ?? "");
      }
    });
    return DetailMeal(
        ingredients: ings,
        area: json['strArea'] ?? "",
        category: json['strCategory'] ?? "",
        instructions: json["strInstructions"] ?? "",
        measures: measure);
  }
}
