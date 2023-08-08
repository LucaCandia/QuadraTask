import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notas_cuadrantes/logica.dart';

class DetailScreen extends StatelessWidget {
//Cuadrente expandido luego de hacerle click.

  final int quadrantNumber;
  final Color quadrantColor;

  const DetailScreen(this.quadrantNumber, this.quadrantColor);
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
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            print("asadasd");
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Agregar una nota"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Nombre de la nota",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Contenido de la nota",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancelar")),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Agregar"))
                  ],
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: quadrantColor,
              child: Center(
                child: Slidable(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: Colors.indigo,
                  ),
                  startActionPane: ActionPane(
                    extentRatio: 0.2,
                    motion: GestureDetector(
                        onTap: () {
                          print("tap pane");
                        },
                        child: CircleAvatar(
                          maxRadius: 5,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                        )),
                    children: [
                      GestureDetector(
                        onTap: () {},
                      )
                    ],
                  ),
                  endActionPane: ActionPane(
                      extentRatio: 0.2,
                      motion: GestureDetector(
                          onTap: () {
                            print("tap pane");
                          },
                          child: CircleAvatar(
                            maxRadius: 5,
                            backgroundColor: Color.fromARGB(255, 255, 17, 0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 30,
                            ),
                          )),
                      children: [
                        GestureDetector(
                          onTap: () {},
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
