import 'package:flutter/material.dart';
import 'package:meal_tracker/model/meal_provider.dart';
import 'package:meal_tracker/widgets/edit_meal_widget.dart';
import 'package:provider/provider.dart';

import '../model/meal.dart';
import 'meal_card_widget.dart';
import 'display_delete_confirmation_dialog.dart';

class MealsScreenView extends StatelessWidget {
  const MealsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        title: const Text('Your meals'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Consumer<MealProvider>(
              builder: (context, mealProvider, child) {
                return MealsList(mealProvider: mealProvider);
              }
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-meal');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MealsList extends StatefulWidget {
  final MealProvider mealProvider;
  const MealsList({super.key, required this.mealProvider});

  @override
  State<StatefulWidget> createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  @override
  Widget build(BuildContext context) {
    final mealsList = widget.mealProvider.meals.toList();

    return ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (context, index) {
          Meal data = mealsList[index];
          return MealCardWidget(
              meal: data,
              onClickMeal: () {},
              onClickDelete: () => showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return DisplayDeleteConfirmationDialog(
                      mealProvider: widget.mealProvider,
                      mealIndex: index
                  );
                }
              ),
              onClickEdit: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      EditMealWidgetView(mealIndex: index)),
                );
              },
          );
        },
    );
  }
}
