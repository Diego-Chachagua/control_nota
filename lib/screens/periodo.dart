import 'package:control_notas/screens/cuadrop1c.dart';
import 'package:control_notas/screens/cuadrop2c.dart';
import 'package:control_notas/screens/cuadrop3c.dart';
import 'package:control_notas/screens/recu12.dart';
import 'package:control_notas/screens/recu2a.dart';
import 'package:flutter/material.dart';

import 'cuadro.dart';
import 'cuadrop2.dart';
import 'cuadrop3.dart';
import 'cuadrop4.dart';
import 'cuadrop4c.dart';

class Periodos extends StatefulWidget {
  String anios;
  String seccion;
  var materia1;
  Periodos(this.anios, this.seccion, this.materia1, {super.key});

  @override
  State<Periodos> createState() => _PeriodosState();
}

class _PeriodosState extends State<Periodos> {
  //Variable, Propiedad
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // ignore: avoid_unnecessary_containers
        home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo_o.jpg'), fit: BoxFit.cover),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  const Text(
                    'ELIJA EL PERIODO AL QUE DESEA INGRESAR',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 10.0),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      setState(() {
                        var nombreM;
                        var materia;
                        if (widget.materia1 == 5 || widget.materia1 == 8 || widget.materia1 == 9 || widget.materia1 == 10 ) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroP1C(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroN1(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }
                        
                        print(widget.anios);
                        print(widget.seccion);
                      });
                    },
                    shape: const RoundedRectangleBorder(),
                    child: const Text(
                      "Periodo 1",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 10.0),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      setState(() {
                        if (widget.materia1 == 5 || widget.materia1 == 8 || widget.materia1 == 9 || widget.materia1 == 10 ) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroP2C(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }else{
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroP2(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }
                      });
                    },
                    shape: const RoundedRectangleBorder(),
                    child: const Text(
                      "Periodo 2",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 10.0),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      setState(() {
                        if (widget.materia1 == 5 || widget.materia1 == 8 || widget.materia1 == 9 || widget.materia1 == 10 ) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroP3C(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroP3(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }
                      });
                    },
                    shape: const RoundedRectangleBorder(),
                    child: const Text(
                      "Periodo 3",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  MaterialButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 10.0),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      setState(() {
                        if (widget.materia1 == 5 || widget.materia1 == 8 || widget.materia1 == 9 || widget.materia1 == 10 ) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroP4C(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuadroP4(widget.anios,
                                    widget.seccion, widget.materia1)));
                        }
                      });
                    },
                    shape: const RoundedRectangleBorder(),
                    child: const Text(
                      "Periodo 4",
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10.0),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      onPressed: () {
                        setState(() {
                          if (widget.anios == "1 año") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Recupera1A(widget.anios,
                                      widget.seccion, widget.materia1)));
                          }else{
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Recupera2A(widget.anios,
                                      widget.seccion, widget.materia1)));

                          }
                        });
                      },
                      shape: const RoundedRectangleBorder(),
                      child: const Text("Recuperacion",
                          style: TextStyle(
                            fontSize: 7.0,
                          ))),
                  MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10.0),
                      color: const Color.fromARGB(255, 255, 255, 255),
                      onPressed: () {
                        setState(() {});
                      },
                      shape: const RoundedRectangleBorder(),
                      child: const Text("Ver cuadro",
                          style: TextStyle(
                            fontSize: 9.0,
                          ))),
                ],
              ))),
        ));
  }
}
