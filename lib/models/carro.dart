class Carro {
  int vehicleType;
  String price;
  String brand;
  String model;
  int modelYear;
  String fuel;
  String codeFipe;
  String referenceMonth;
  String fuelAcronym;

  Carro({
    required this.vehicleType,
    required this.price,
    required this.brand,
    required this.model,
    required this.modelYear,
    required this.fuel,
    required this.codeFipe,
    required this.referenceMonth,
    required this.fuelAcronym,
  });

  factory Carro.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'vehicleType': int vehicleType,
        'price': String price,
        'brand': String brand,
        'model': String model,
        'modelYear': int modelYear,
        'fuel': String fuel,
        'codeFipe': String codeFipe,
        'referenceMonth': String referenceMonth,
        'fuelAcronym': String fuelAcronym,
      } =>
        Carro(
          vehicleType: vehicleType,
          price: price,
          brand: brand,
          model: model,
          modelYear: modelYear,
          fuel: fuel,
          codeFipe: codeFipe,
          referenceMonth: referenceMonth,
          fuelAcronym: fuelAcronym,
        ),
      _ => throw const FormatException('Failed to load carro'),
    };
  }
}
