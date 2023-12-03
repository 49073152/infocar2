class Marca {
  String code;
  String name;

  Marca({
    required this.code,
    required this.name,
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'code': String code,
        'name': String name,
      } =>
        Marca(
          code: code,
          name: name,
        ),
      _ => throw const FormatException('Failed to load marcas'),
    };
  }
}
