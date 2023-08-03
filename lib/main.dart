import 'package:flutter/material.dart';
import 'package:notas_cuadrantes/logica.dart';
import 'package:notas_cuadrantes/widgets.dart';

/*
PrioriTask: Organiza tareas por cuadrantes de prioridad"   
PriorityQuads: Organize Tasks with Quadrants
TaskMatrix: Prioritize Your To-Do List
QuadraTasks: Efficient Task Prioritization
PriorityMatrix: Manage Tasks in Quadrants
TaskQuadrants: Prioritize with Ease
QuadraPriority: Organize Tasks by Quadrants
MatrixTasks: Effortless Task Prioritization
QuadraPlanner: Plan Tasks with Priorities
PriorityGrid: Efficiently Manage Tasks
QuadraToDos: Prioritize Your To-Dos
*/

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {"home": (context) => Home()},
    );
  }
}

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
        )
      ],
    ));
  }
}

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
                  builder: (context) => DetailScreen(quadrantNumber)));
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
