import 'package:flutter/material.dart';
import 'package:infocar/models/carro.dart';
import 'package:infocar/models/marcas.dart';
import 'package:infocar/services/carro_service.dart';

class PagePerfil extends StatefulWidget {
  const PagePerfil({super.key});

  @override
  State<PagePerfil> createState() => _PagePerfilState();
}

class _PagePerfilState extends State<PagePerfil> {
  late Future<Carro> carroFuture;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carroFuture = getCar();
   
    //getMarcas()
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Carro>(
      future: carroFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.brand),
              Text(snapshot.data!.model),
              Text(snapshot.data!.price),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
