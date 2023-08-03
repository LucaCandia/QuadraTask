import 'package:flutter/material.dart';
import 'package:notas_cuadrantes/logica.dart';

class Cuadrante2 extends StatelessWidget {
  final int quadrantNumber;
  final Size size;
  final Color color;
  const Cuadrante2({
    super.key,
    required this.size,
    required this.color,
    required this.quadrantNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: size.height * 0.4,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
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

class DetailScreen extends StatelessWidget {
//Cuadrente expandido luego de hacerle click.

  final int quadrantNumber;

  const DetailScreen(this.quadrantNumber);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          tittleQuadrant(quadrantNumber),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            addtask();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Center(
                child: Text(""),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

addtask() {
  print("asdsad");
}
