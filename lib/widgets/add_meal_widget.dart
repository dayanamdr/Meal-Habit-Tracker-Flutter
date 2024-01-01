import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/meal_provider.dart';

class AddMealWidgetView extends StatelessWidget {
  const AddMealWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade800,
          title: const Text('Add a new meal'),
          centerTitle: true,
          elevation: 0,
        ),
      body: Column(
        children: [
          Expanded(child: InputFieldList())
        ],
      )
    );
  }
  
}

class InputFieldList extends StatelessWidget {
  InputFieldList({super.key});

  final _name = TextEditingController();
  final _type = TextEditingController();
  final _calories = TextEditingController();
  final _protein = TextEditingController();
  final _fats = TextEditingController();
  final _carbs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);

    _name.text = '';
    _type.text = '';
    _calories.text = '';
    _protein.text = '';
    _fats.text = '';
    _carbs.text = '';

    Widget textField(String label, TextEditingController controller, TextInputType inputType) {
      return Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.blueGrey),
            ),
          )
        );
    }

    Widget addButton(BuildContext context, MealProvider mealProvider) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: ElevatedButton(
          child: const Text("Add meal"),
          onPressed: () {
            mealProvider.addMeal(
                name: _name.text,
                type: _type.text,
                calories: int.parse(_calories.text),
                protein: int.parse(_protein.text),
                fats: int.parse(_fats.text),
                carbs: int.parse(_carbs.text)
            );
            //mealProvider.notifyListeners();
            Navigator.of(context).pop();
          },
        ),
      );
    }

    return ListView(
      children: [
        textField("Name", _name, TextInputType.text),
        textField("Type", _type, TextInputType.text),
        textField("Calories", _calories, TextInputType.number),
        textField("Protein", _protein, TextInputType.number),
        textField("Fats", _fats, TextInputType.number),
        textField("Carbs", _carbs, TextInputType.number),
        addButton(context, mealProvider),
      ],
    );
  }
}

