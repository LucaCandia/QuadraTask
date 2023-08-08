import 'package:flutter/material.dart';
import 'package:notas_cuadrantes/main.dart';
import 'package:notas_cuadrantes/screens/widgets.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              SizedBox(width: 40),
              NombreCuadranteHor(
                nombre: 'Urgente',
              ),
              SizedBox(width: 20),
              NombreCuadranteHor(
                nombre: 'No Urgente',
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              SizedBox(height: 40),
              RotatedBox(
                quarterTurns: 3,
                child: NombreCuadranteVert(
                  nombre: 'Importante',
                ),
              ),
              SizedBox(height: 20),
              RotatedBox(
                quarterTurns: 3,
                child: NombreCuadranteVert(
                  nombre: 'No Importante',
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 30),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    Cuadrante(
                      quadrantNumber: 1,
                      size: size,
                      color: Colors.red,
                    ),
                    Cuadrante(
                      quadrantNumber: 2,
                      size: size,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Cuadrante(
                      quadrantNumber: 3,
                      size: size,
                      color: Colors.green,
                    ),
                    Cuadrante(
                      quadrantNumber: 4,
                      size: size,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
