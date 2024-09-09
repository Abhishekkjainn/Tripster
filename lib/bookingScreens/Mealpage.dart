import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tripster/controllers/searchcontroller.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  OnewayController onewayController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomisemealBanner(),
            ClassicMealsBanner(),
            (onewayController.selectedMealName == "")
                ? Container()
                : SelectedMealCard(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  itemCount: onewayController.foodlength,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Container(
                        height: 80,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 1)),
                            borderRadius: BorderRadius.circular(0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  width: 160,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        onewayController.Mealname[index]
                                            .toString()
                                            .trim(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        onewayController.MealCode[index]
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (onewayController.selectedMeal ==
                                      index + 1) {
                                    onewayController.selectedMeal = -1;
                                    onewayController.selectedMealName = "";
                                    onewayController.selectedMealAmount = 0.0;
                                    onewayController.selectedMealCode = "";
                                  } else {
                                    onewayController.selectedMeal = index + 1;
                                    onewayController.selectedMealName =
                                        onewayController.Mealname[index];
                                    onewayController.selectedMealAmount =
                                        onewayController.MealAmount[index];
                                    onewayController.selectedMealCode =
                                        onewayController.MealCode[index];
                                  }
                                });

                                print(onewayController.selectedMealName);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: (onewayController.selectedMeal ==
                                                index + 1)
                                            ? Colors.blue
                                            : Colors.white,
                                        border: Border.all(
                                            color: Colors.blue, width: 1),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Icon(
                                        CupertinoIcons.add,
                                        color: (onewayController.selectedMeal ==
                                                index + 1)
                                            ? Colors.white
                                            : Colors.blue,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    (onewayController.MealAmount[index] == 0.0)
                                        ? 'Free'
                                        : onewayController.MealAmount[index]
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding SelectedMealCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: IntrinsicHeight(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selected Meal',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Meal Name - ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      onewayController.selectedMealName,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Meal Code - ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      onewayController.selectedMealCode,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Meal Amount - ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      (onewayController.selectedMealAmount == 0.0)
                          ? 'Free'
                          : onewayController.selectedMealAmount.toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding ClassicMealsBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        width: double.maxFinite,
        height: 150,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 214, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Image(
                image: AssetImage('assets/images/meal.png'),
                width: 80,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Classic Meals for You',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Choose from the Variety of the meals offered and add it to your Journey.',
                      // overflow: TextOverflow.ellipsis,
                      // maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Get the Discount of 10% upto 40 Rs',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding CustomisemealBanner() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Container(
        height: 30,
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(5)),
        child: Text(
          'Choose and Customise the Meals for your needs!',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
