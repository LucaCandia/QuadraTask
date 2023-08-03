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
        body: Column(
      children: [
        //fila para mostrar titulos: "URGENTE - NO URGENTE"
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 25,
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            NombreCuadranteHor(
              nombre: 'Urgente',
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
            NombreCuadranteHor(
              nombre: 'No Urgente',
            ),
            SizedBox(
              width: size.width * 0.03,
            ),
          ],
        ),
        //Fila para mostrar dos cuadrantes: urgente e imporante. no urgente e importante
        Row(
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: NombreCuadranteVert(
                nombre: 'Importante',
              ),
            ),
            SizedBox(width: 10),
            Cuadrante(
              //urgente e imporante
              size: size,
              color: Colors.purple,
           
              quadrantNumber: 1,
            ),
            SizedBox(width: 10),
            Cuadrante(
              //no urgente e importante
              quadrantNumber: 2,
              size: size,
              color: Colors.red,
          
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        
        Row(
          /*
          Fila para mostrar dos cuadrantes: urgente y no importante. no importante y no urgente
          */
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: NombreCuadranteVert(
                nombre: 'No Importante',
              ),
            ),
            SizedBox(width: 10),
            Cuadrante(
              quadrantNumber: 3,
              size: size,
              color: Colors.green,
             
            ),
            SizedBox(width: 10),
            Cuadrante(
              quadrantNumber: 4,
              size: size,
              color: Colors.blue,
         
            ),
          ],
        ),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(quadrantNumber)));
      },
      child: Container( 
        //el cuadrante en si
        height: size.height * 0.4,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}




