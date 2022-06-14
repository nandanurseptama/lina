import 'package:flutter/material.dart';
import 'package:lina/cores/models/category_model.dart';
import 'package:lina/cores/models/meal_model.dart';
import 'package:lina/cores/remote_datasource/remote_datasource.dart';
import 'package:lina/home/widget/meal_widget.dart';
import 'package:lina/login/style/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? isLoadCategoryError, isOnLoadMealByCategoryError;
  bool isOnloadCategory = false, isOnLoadMealByCategory = false;
  final RemoteDataSource remoteDataSource = RemoteDataSource();
  List<CategoryModel> mealCategories =
      List<CategoryModel>.empty(growable: true);

  List<MealModel> meals = List<MealModel>.empty(growable: true);
  int selectedCategory = 0;
  PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 0.9);

  Future<void> loadCategory() {
    setState(() {
      isOnloadCategory = true;
    });
    return remoteDataSource.getMealCategory().then((value) {
      setState(() {
        isOnloadCategory = false;
        mealCategories = value;
        selectedCategory = 0;
      });
      loadMeals(categoryName: mealCategories[selectedCategory].categoryName);
    }).catchError((error) {
      setState(() {
        isOnloadCategory = false;
        isLoadCategoryError = error.toString();
      });
    });
  }

  Future<void> loadMeals({required String categoryName}) {
    setState(() {
      isOnLoadMealByCategory = true;
    });
    return remoteDataSource
        .getMealByCategory(categoryName: categoryName)
        .then((value) {
      setState(() {
        isOnLoadMealByCategory = false;
        meals = value;
      });
    }).catchError((error) {
      setState(() {
        isOnLoadMealByCategory = false;
        isOnLoadMealByCategoryError = error.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isOnloadCategory && isOnLoadMealByCategory
          ? _loadingWidget()
          : Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                _categoryList(),
                const SizedBox(
                  height: 30,
                ),
                isOnLoadMealByCategory ? _loadingWidget() : _mealList(),
              ],
            ),
    );
  }

  Widget _loadingWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Loading....",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Color(LoginRegisterColor.primaryColor),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryList() {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: mealCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
              loadMeals(
                  categoryName: mealCategories[selectedCategory].categoryName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: index != selectedCategory
                    ? null
                    : const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2,
                                color: Color(LoginRegisterColor.primaryColor))),
                      ),
                child: Text(
                  mealCategories[index].categoryName,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    color: index == selectedCategory
                        ? const Color(LoginRegisterColor.primaryColor)
                        : const Color(LoginRegisterColor.secondaryButtonColor),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _mealList() {
    return SizedBox(
        height: 490,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MealWidget(meal: meals[index]),
            );
          },
        ));
  }
}
