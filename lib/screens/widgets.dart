import 'package:flutter/material.dart';
import 'package:notas_cuadrantes/logica.dart';
import 'package:notas_cuadrantes/screens/detailsscreen.dart';

class Cuadrante extends StatelessWidget {
  const Cuadrante({
    super.key,
    required this.quadrantNumber,
    required this.size,
    required this.color,
  });

  final int quadrantNumber;
  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailScreen(quadrantNumber, color)));
        },
        child: Container(
          //el cuadrante en si
          height: size.height * 0.4,
          width: size.width * 0.4,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class NombreCuadranteHor extends StatelessWidget {
  final String nombre;
  const NombreCuadranteHor({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.4,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(nombre)));
  }
}

class NombreCuadranteVert extends StatelessWidget {
  final String nombre;
  const NombreCuadranteVert({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.height * 0.4,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(nombre)));
  }
}
