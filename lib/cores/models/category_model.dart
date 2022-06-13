class CategoryModel {
  final String idCategory;
  final String categoryName;
  final String categoryImage;

  CategoryModel({
    required this.idCategory,
    required this.categoryImage,
    required this.categoryName,
  });

  factory CategoryModel.fromJson({required Map<String, dynamic> json}) {
    return CategoryModel(
        idCategory: json['idCategory'] ?? "",
        categoryImage: json['strCategoryThumb'] ?? "",
        categoryName: json['strCategory'] ?? "");
  }
}
