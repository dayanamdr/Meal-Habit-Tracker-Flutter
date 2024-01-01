class Meal {
  final String? name;
  final String? type;
  final int? calories;
  final int? protein;
  final int? fats;
  final int? carbs;

  Meal({
    required this.name,
    required this.type,
    required this.calories,
    required this.protein,
    required this.fats,
    required this. carbs
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json['name'] as String?,
      type: json['type'] as String?,
      calories: json['calories'] as int?,
      protein: json['protein'] as int?,
      fats: json['fats'] as int?,
      carbs: json['carbs'] as int?,
    );
  }
}