import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notas_cuadrantes/logica.dart';

class DetailScreen extends StatefulWidget {
//Cuadrente expandido luego de hacerle click.

  final int quadrantNumber;
  final Color quadrantColor;

  const DetailScreen(this.quadrantNumber, this.quadrantColor);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          tittleQuadrant(widget.quadrantNumber),
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
                  content: DIALOGCONTENT(
                    onAccept: () {
                      print("acepto");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print("cancelo");
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: widget.quadrantColor,
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

class DIALOGCONTENT extends StatefulWidget {
  final VoidCallback onAccept;
  final VoidCallback onCancel;
  const DIALOGCONTENT(
      {super.key, required this.onAccept, required this.onCancel});

  @override
  State<DIALOGCONTENT> createState() => _DIALOGCONTENTState();
}

class _DIALOGCONTENTState extends State<DIALOGCONTENT> {
  bool hidden = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Nombre de la nota",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              print("cambio estado");
              setState(() {
                hidden = !hidden;
              });
            },
            child: Row(
              children: [
                // if (hidden) SizedBox(height: 20) else SizedBox(height: 50),
                Icon(hidden ? Icons.arrow_downward : Icons.arrow_upward),
                Text(
                  hidden ? "Agregar Descripción" : "Quitar Descripción",
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.bounceOut,
          child: hidden
              ? SizedBox()
              : TextField(
                  decoration: InputDecoration(
                      hintText: "Descripción",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
        ),
        SizedBox(height: 20),
        Column(
          children: [
            TextButton(
                onPressed: () {
                  widget.onCancel();
                },
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  widget.onAccept();
                },
                child: Text("Agregar"))
          ],
        )
      ],
    );
  }
}
