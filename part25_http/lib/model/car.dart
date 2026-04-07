import 'dart:convert';

Car carFromJson(String str) => Car.fromJson(json.decode(str));

String carToJson(Car data) => json.encode(data.toJson());

class Car {
  String carName;
  String country;
  int establishmentYear;
  List<Model> model;

  Car({
    required this.carName,
    required this.country,
    required this.establishmentYear,
    required this.model,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    carName: json["car_name"],
    country: json["country"],
    establishmentYear: json["establishment_year"],
    model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "car_name": carName,
    "country": country,
    "establishment_year": establishmentYear,
    "model": List<dynamic>.from(model.map((x) => x.toJson())),
  };
}

class Model {
  String modelName;
  int price;
  bool gasoline;

  Model({
    required this.modelName,
    required this.price,
    required this.gasoline,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    modelName: json["model_name"],
    price: json["price"],
    gasoline: json["gasoline"],
  );

  Map<String, dynamic> toJson() => {
    "model_name": modelName,
    "price": price,
    "gasoline": gasoline,
  };
}
