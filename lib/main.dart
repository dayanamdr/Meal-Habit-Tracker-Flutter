import 'package:flutter/material.dart';
import 'package:meal_tracker/widgets/add_meal_widget.dart';
import 'package:meal_tracker/widgets/list_meals_widget.dart';
import 'package:provider/provider.dart';

import 'model/meal_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MealProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade600),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MealPal'),
      routes: {
        '/add-meal': (context) => AddMealWidgetView(),
        '/list-meals': (context) => MealsScreenView(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.svg.png'),
              const SizedBox(height: 35),
              ElevatedButton(
                  onPressed: () { Navigator.pushNamed(context, '/list-meals'); },
                  child: const Text("List meals"),
              )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-meal');
        },
        tooltip: 'Add a new meal',
        child: const Icon(Icons.add),
      ),
    );
  }
}
