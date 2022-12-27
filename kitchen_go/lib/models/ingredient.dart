class Ingredient {
  String id;
  String name;
  int amount;
  String? unit;
  Ingredient(
      {required this.id,
      required this.name,
      required this.amount,
      required this.unit});
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['_id'],
      name: json['name'],
      amount: json['amount'],
      unit: json['unit'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['unit'] = unit;
    data['amount'] = amount;
    return data;
  }
}
