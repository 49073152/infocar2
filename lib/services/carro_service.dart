import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:infocar/models/carro.dart';

Future<Carro> getCar() async {
  final response = await http.get(Uri.parse(
      'https://parallelum.com.br/fipe/api/v2/cars/brands/1/models/1/years/1992-1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Carro.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load carro');
  }
}
