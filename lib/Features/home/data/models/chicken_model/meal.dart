class Meal {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meal({this.strMeal, this.strMealThumb, this.idMeal});

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    strMeal: json['strMeal'] as String?,
    strMealThumb: json['strMealThumb'] as String?,
    idMeal: json['idMeal'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'strMeal': strMeal,
    'strMealThumb': strMealThumb,
    'idMeal': idMeal,
  };
}
