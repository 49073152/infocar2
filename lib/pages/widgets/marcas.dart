import 'package:flutter/material.dart';
import 'package:infocar/models/marcas.dart';
import 'package:infocar/services/carro_service.dart';

class Marcas extends StatefulWidget {
  const Marcas({super.key});

  @override
  State<Marcas> createState() => _MarcasState();
}

class _MarcasState extends State<Marcas> {
  late Future<List<Marca>> marcasFuture;

  @override
  void initState() {
    super.initState();
    marcasFuture = getMarcas();
  }

  MarcaItem(String titulo) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/acura_logo.png",
              width: 48,
            ),
            Text(
              titulo,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );

  Widget buildMarcas(List<Marca> marcas) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // number of items in each row
        mainAxisSpacing: 10, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (context, index) {
        return MarcaItem(marcas[index].name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: Color.fromRGBO(244, 244, 244, 1),
        color: const Color.fromRGBO(212, 212, 212, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Marcas",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "ver todas",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(53, 85, 255, 1),
                    decorationColor: Color.fromRGBO(53, 85, 255, 1),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            FutureBuilder<List<Marca>>(
              future: marcasFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  // return const Text(" available");
                  final marcas = snapshot.data!;
                  return buildMarcas(marcas);
                } else {
                  return const Text("No data available");
                }
              },
            ),

            // GridView.count(
            //   padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            //   crossAxisCount: 4,
            //   crossAxisSpacing: 8,
            //   mainAxisSpacing: 10,
            //   shrinkWrap: true,
            //   children: [
            //     MarcaItem("Acura"),
            //     MarcaItem("Acura"),
            //     MarcaItem("Acura"),
            //     MarcaItem("Acura"),
            //     MarcaItem("Acura"),
            //     MarcaItem("Acura"),
            //     MarcaItem("Acura"),
            //     MarcaItem("Acura"),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
