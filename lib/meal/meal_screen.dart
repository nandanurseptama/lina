import 'package:flutter/material.dart';
import 'package:lina/cores/models/detail_meal.dart';
import 'package:lina/cores/models/meal_model.dart';
import 'package:lina/cores/remote_datasource/remote_datasource.dart';
import 'package:lina/login/style/color.dart';

class MealScreen extends StatefulWidget {
  final MealModel meal;
  final Color mealColor;
  const MealScreen({Key? key, required this.meal, required this.mealColor})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  bool isOnLoadDetailMeal = true;
  String? loadDetailMealError;
  RemoteDataSource remoteDataSource = RemoteDataSource();
  DetailMeal? detailMeal;
  bool isDetailMealExpanded = false;
  bool instructionMealExpanded = false;

  bool isIngredientExpanded = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadDetailMeal();
    });
  }

  Future<void> loadDetailMeal() {
    return remoteDataSource
        .getMealDetailById(
      id: widget.meal.idMeal,
    )
        .then((value) {
      setState(() {
        detailMeal = value;
        isOnLoadDetailMeal = false;
      });
    }).catchError((onError) {
      setState(() {
        loadDetailMealError = onError.toString();
        isOnLoadDetailMeal = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.mealColor,
        elevation: 0,
      ),
      floatingActionButton: _detailMealWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.only(top: 10),
        color: widget.mealColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                widget.meal.mealName,
                style: const TextStyle(
                    color: Color(
                      LoginRegisterColor.primaryFontColor,
                    ),
                    fontWeight: FontWeight.normal,
                    fontSize: 24,
                    fontFamily: "Poppins"),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: Hero(
                    tag: widget.meal.mealImage,
                    child: Container(
                      height: (MediaQuery.of(context).size.width - 90) + 30,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: const Border.fromBorderSide(
                              BorderSide(color: Colors.transparent, width: 1)),
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.meal.mealImage,
                              ),
                              fit: BoxFit.cover)),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailMealWidget() {
    return SingleChildScrollView(
      physics: isDetailMealExpanded
          ? const ScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: AnimatedContainer(
        height: !isDetailMealExpanded ? 290 : null,
        duration: const Duration(seconds: 1),
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      fontFamily: "Poppins"),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                  icon: Icon(isDetailMealExpanded
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      isDetailMealExpanded = !isDetailMealExpanded;
                      instructionMealExpanded =
                          (isDetailMealExpanded == false) ? false : true;
                      isIngredientExpanded =
                          (isDetailMealExpanded == false) ? false : true;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ..._mealDetail()
          ],
        ),
      ),
    );
  }

  List<Widget> _mealDetail() {
    if (isOnLoadDetailMeal) {
      return [
        const Center(
          child: CircularProgressIndicator(
            color: Color(LoginRegisterColor.primaryColor),
          ),
        ),
      ];
    }
    if (loadDetailMealError != null) {
      return [
        Text(
          loadDetailMealError!,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 16, fontFamily: "Poppins"),
          textAlign: TextAlign.left,
        )
      ];
    }
    if (detailMeal == null) {
      return [
        const Text(
          "Detail meal is empty",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 16, fontFamily: "Poppins"),
          textAlign: TextAlign.left,
        )
      ];
    }
    return [
      /// category
      Row(
        children: [
          const Icon(
            Icons.category,
            color: Color(LoginRegisterColor.secondaryButtonColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(detailMeal!.category,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: "Poppins",
                  color: Color(LoginRegisterColor.primaryColor))),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          const Icon(
            Icons.location_city,
            color: Color(LoginRegisterColor.secondaryButtonColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(detailMeal!.area,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  fontFamily: "Poppins",
                  color: Color(LoginRegisterColor.primaryColor))),
        ],
      ),

      const SizedBox(
        height: 20,
      ),
      ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          debugPrint(isDetailMealExpanded.toString());
          if (isDetailMealExpanded) {
            if (panelIndex == 0) {
              setState(() {
                isIngredientExpanded = !isIngredientExpanded;
              });
            } else {
              setState(() {
                instructionMealExpanded = !instructionMealExpanded;
              });
            }
          }
        },
        children: [
          ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: isIngredientExpanded,
            headerBuilder: (context, isExpanded) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "Ingredient & Measures",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "Poppins"),
                  textAlign: TextAlign.left,
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: _ingridientAndMeasure(),
            ),
          ),
          ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: instructionMealExpanded,
            headerBuilder: (context, isExpanded) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  "Instruction",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "Poppins"),
                  textAlign: TextAlign.left,
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                detailMeal!.instructions,
                style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    fontFamily: "Poppins"),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 20,
      ),
    ];
  }

  Widget _ingridientAndMeasure() {
    return Column(
        children: List.generate(detailMeal!.ingredients.length, (index) {
      var measure = "";
      try {
        measure = detailMeal!.measures[index];
      } catch (e) {
        measure = "";
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            detailMeal!.ingredients[index],
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                fontFamily: "Poppins"),
            textAlign: TextAlign.left,
          ),
          Text(
            measure,
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                fontFamily: "Poppins"),
            textAlign: TextAlign.left,
          ),
        ],
      );
    }));
  }
}
