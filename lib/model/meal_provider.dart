import 'package:flutter/cupertino.dart';
import 'meal.dart';

class MealProvider with ChangeNotifier {
  final List<Meal> _meals = [
    Meal(name: "Protein bar", type: "snack", calories: 202, protein: 23, fats: 5, carbs: 30),
    Meal(name: "Burger & fries", type: "lunch", calories: 750, protein: 20, fats:30, carbs:63),
    Meal(name: "Salad with chicken", type: "dinner", calories: 387, protein: 18, fats: 14, carbs: 31),
    Meal(name: "Cereals", type: "breakfast", calories: 202, protein: 25, fats: 5, carbs: 45),
    Meal(name: "Pancakes with berries", type: "breakfast", calories: 430, protein: 35, fats:14, carbs:53),
    Meal(name: "Avocado toast", type: "breakfast", calories: 311, protein: 22, fats: 30, carbs: 35),
  ];

  List<Meal> get meals => _meals;

  void addMeal({required String name, required String type, required int calories,
    required int protein, required int fats, required int carbs}) {
    _meals.add(Meal(
        name: name,
        type: type,
        calories: calories,
        protein: protein,
        fats: fats,
        carbs: carbs
    ));
    notifyListeners();
  }

  void deleteMeal({required int index}) {
    if (index >= 0 && index < _meals.length) {
      _meals.removeAt(index);
      notifyListeners();
    }
  }

  void editMeal({required int index, required Meal newMeal}) {
    if(index >= 0 && index <_meals.length) {
      _meals[index] = Meal(
          name: newMeal.name,
          type: newMeal.type,
          calories: newMeal.calories,
          protein: newMeal.protein,
          fats: newMeal.fats,
          carbs: newMeal.carbs
      );
      notifyListeners();
    }
  }
}