import 'package:flutter/material.dart';
import 'package:meal_tracker/model/meal_provider.dart';

class DisplayDeleteConfirmationDialog extends StatelessWidget {
  final MealProvider mealProvider;
  final int mealIndex;

  const DisplayDeleteConfirmationDialog({super.key, required this.mealProvider, required this.mealIndex});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Delete meal",
        textAlign: TextAlign.center,
      ),
      content: const Text(
        "Are you sure you want to delete this meal?",
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  mealProvider.deleteMeal(index: mealIndex);
                  Navigator.of(context).pop();
                },
                child: const Text("Yes")
            ),
            const SizedBox(width: 50,),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No")
            ),
          ],
        ),
      ],
    );
  }
}