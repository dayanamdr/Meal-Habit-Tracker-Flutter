import 'package:flutter/material.dart';
import 'package:meal_tracker/model/meal_provider.dart';
import 'package:provider/provider.dart';

import '../model/meal.dart';

class MealCardWidget extends StatelessWidget {
  final Meal meal;
  final VoidCallback onClickMeal;
  final VoidCallback onClickDelete;
  final VoidCallback onClickEdit;

  const MealCardWidget({
    Key? key,
    required this.meal,
    required this.onClickMeal,
    required this.onClickDelete,
    required this.onClickEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: InkWell(
        onTap: onClickMeal,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade500)]
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${meal.name}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                          Text("${meal.type}", style: const TextStyle(fontStyle: FontStyle.italic),)
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: onClickDelete, icon: const Icon(Icons.delete, color: Colors.red)),
                        IconButton(onPressed: onClickEdit, icon: const Icon(Icons.edit, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Calories: ${meal.calories}"),
                        Text("Protein: ${meal.protein}"),
                        Text("Fats: ${meal.fats}"),
                        Text("Carbs: ${meal.carbs}"),
                      ],
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

}