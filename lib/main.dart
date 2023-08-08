import 'package:flutter/material.dart';
import 'package:notas_cuadrantes/logica.dart';
import 'package:notas_cuadrantes/screens/detailsscreen.dart';
import 'package:notas_cuadrantes/screens/homescreen.dart';
import 'package:notas_cuadrantes/screens/widgets.dart';

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
