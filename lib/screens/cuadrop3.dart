// ignore_for_file: use_build_context_synchronously

import 'package:control_notas/screens/periodo.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../developer/consultasf.dart';

class CuadroP3 extends StatefulWidget {
  String anio;
  String seccion;
  var materia1;

  CuadroP3(this.anio, this.seccion, this.materia1, {super.key});

  @override
  State<CuadroP3> createState() => _CuadroP3State();
}

class _CuadroP3State extends State<CuadroP3> {
  final nieEstu = TextEditingController();

  final a1 = TextEditingController();

  final a2 = TextEditingController();

  final po = TextEditingController();

  var nie, act1, act2, pruO;

  List<String> nombre = [];
  List<String> nie3 = [];
  List<String> apellido = [];
  List<String> act1_p3 = [];
  List<String> act2_p3 = [];
  List<String> po_p3 = [];
  List<String> promedio_p3 = [];
  var reslt;

  @override
  void initState() {
    super.initState();
    var nombreM;
    var materia;
   if (widget.materia1 == 1) {
      nombreM = "Lenguaje";
      materia = "1";
    } else if (widget.materia1 == 2) {
      nombreM = "Matematica";
      materia = "2";
    } else if (widget.materia1 == 3) {
      nombreM = "Ciencias";
      materia = "3";
    } else if (widget.materia1 == 4) {
      nombreM = " Estudios Sociales";
      materia = "4";
    }else if (widget.materia1 == 6) {
      nombreM = " Ingles";
      materia = "6";
    }else if (widget.materia1 == 7) {
      nombreM = " Informatica";
      materia = "7";
    }

    (() async {
      var grado = "";
      var seccion1 = "";
      if (widget.anio == "1 año") {
        grado = "1";
      } else if (widget.anio == "2 año") {
        grado = "2";
      }

      

     reslt = await mostrarP3(widget.anio, widget.seccion, materia);
      if (reslt != "noExisten") {
        for (var i = 0; i < reslt.length; i++) {
          var dato = reslt[i];
          //variables utilizadas para guardar los datos extraidos de la base
          var act1_p3n;
          var act2_p3n;
          var po_p3n;

          print(dato["nombre_estudiante"]);
          print(dato["nie"]);
          print(dato["apellido_estudiante"]);
          print(dato["act1_p3"]);
          print(dato["act2_p3"]);
          print(dato["po_p3"]);
          print(grado);
          print(seccion1);
          print(widget.materia1);
          // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_estudiante"];
          var ape_tem = dato["apellido_estudiante"];
          if (dato["act1_p3"] != null) {
            act1_p3n = dato["act1_p3"];
          } else {
            act1_p3n = "0";
          }

          if (dato["act2_p3"] != null) {
            act2_p3n = dato["act2_p3"];
          } else {
            act2_p3n = "0";
          }

          if (dato["po_p3"] != null) {
            po_p3n = dato["po_p3"];
          } else {
            po_p3n = "0";
          }
//variables utilizadas para calcular promedio del periodo
          var actividad1 = int.parse(act1_p3n);
          var actividad2 = int.parse(act2_p3n);
          var prueba = int.parse(po_p3n);
          //asignacion de valor de promedio a variabe
          var promedio = (actividad1 + actividad2 + prueba) / 3;
          // ignore: non_constant_identifier_names
          var id_tem = dato["nie"];

          setState(() {
            // Actualizar las listas con los datos obtenidos
            nombre.add(nom_tem);
            nie3.add(id_tem);
            apellido.add(ape_tem);
            act1_p3.add(act1_p3n);
            act2_p3.add(act2_p3n);
            po_p3.add(po_p3n);
            promedio_p3.add(promedio.toStringAsFixed(1));
          });
        }
      }
    })();
  }

  @override
  Widget build(BuildContext context) {
    var nombreM;
    var materia;
   if (widget.materia1 == 1) {
      nombreM = "Lenguaje";
      materia = "1";
    } else if (widget.materia1 == 2) {
      nombreM = "Matematica";
      materia = "2";
    } else if (widget.materia1 == 3) {
      nombreM = "Ciencias";
      materia = "3";
    } else if (widget.materia1 == 4) {
      nombreM = " Estudios Sociales";
      materia = "4";
    }else if (widget.materia1 == 6) {
      nombreM = " Ingles";
      materia = "6";
    }else if (widget.materia1 == 7) {
      nombreM = " Informatica";
      materia = "7";
    }
    var seccion1;
     if (widget.seccion == "1") {
        seccion1 = "A";
      } else if (widget.seccion == "2") {
        seccion1 = "F";
      } else if (widget.seccion == "3") {
        seccion1 = "E";
      } else if (widget.seccion == "4") {
        seccion1 = "H";
      } else if (widget.seccion == "5") {
        seccion1 = "G";
      } else if (widget.seccion == "6") {
        seccion1 = "D";
      }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo_o.jpg'), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          height: 100,
                          width: 50,
                        ),
                        Text(
                          'GRADO: "${widget.anio}°"',
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'SECCION: "${seccion1}"',
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 50,
                        ),
                        Text(
                          'MATERIA: "${nombreM}"',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          'PERIODO: 3',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //encabezado de tabla de notas
                    Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FractionColumnWidth(0.09),
                          1: FractionColumnWidth(0.17),
                          2: FractionColumnWidth(0.35),
                          3: FractionColumnWidth(0.08),
                          4: FractionColumnWidth(0.08),
                          5: FractionColumnWidth(0.08),
                          6: FractionColumnWidth(0.08),
                        },
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('N°'),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('NIE'),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('Nombre completo'),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('A1'),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('A2'),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('PO'),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('PM'),
                                )),
                          ])
                        ]),
                    //inicio de definicon de tabla para datos desde la base

                    Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FractionColumnWidth(0.09),
                          1: FractionColumnWidth(0.17),
                          2: FractionColumnWidth(0.35),
                          3: FractionColumnWidth(0.08),
                          4: FractionColumnWidth(0.08),
                          5: FractionColumnWidth(0.08),
                          6: FractionColumnWidth(0.08),
                        },
                        border: TableBorder.all(),
                        children: [
                          TableRow(children: [
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text('1'),
                                    ],
                                  ),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    children: [
                                      for (var i = 0; i < nie3.length; i++)
                                        Text(nie3[i],
                                            style:
                                                const TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          for (var i = 0;
                                              i < nombre.length;
                                              i++)
                                            Text(nombre[i],
                                                style: const TextStyle(
                                                    fontSize: 15)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          for (var i = 0;
                                              i < apellido.length;
                                              i++)
                                            Text(apellido[i],
                                                style: const TextStyle(
                                                    fontSize: 15)),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    children: [
                                      for (var i = 0; i < act1_p3.length; i++)
                                        Text(act1_p3[i],
                                            style:
                                                const TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    children: [
                                      for (var i = 0; i < act2_p3.length; i++)
                                        Text(act2_p3[i],
                                            style:
                                                const TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    children: [
                                      for (var i = 0; i < po_p3.length; i++)
                                        Text(po_p3[i],
                                            style:
                                                const TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: Center(
                                  child: Column(
                                    children: [
                                      for (var i = 0;
                                          i < promedio_p3.length;
                                          i++)
                                        Text(promedio_p3[i],
                                            style:
                                                const TextStyle(fontSize: 15)),
                                    ],
                                  ),
                                )),
                          ])
                        ]),

                    const SizedBox(
                      height: 290,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 390,
                          color: Color.fromARGB(176, 3, 52, 95),
                          foregroundDecoration:
                              BoxDecoration(border: Border.all(width: 3.0)),
                          child: Center(
                            child: Column(children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '  Ingreso de Notas',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'NIE:',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      width: 90,
                                      height: 20,
                                      child: Center(
                                          child: TextField(
                                        controller: nieEstu,
                                        keyboardType: TextInputType.number,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Actividad 1:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 50,
                                    height: 20,
                                    child: Center(
                                        child: TextField(
                                      controller: a1,
                                      keyboardType: TextInputType.number,
                                    )),
                                  ),
                                  const SizedBox(width: 15),
                                  const Text(
                                    'Actividad 2:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 50,
                                    height: 20,
                                    child: Center(
                                        child: TextField(
                                      controller: a2,
                                      keyboardType: TextInputType.number,
                                    )),
                                  ),
                                  const SizedBox(width: 15),
                                  const Text(
                                    'Prueba:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 50,
                                    height: 20,
                                    child: Center(
                                        child: TextField(
                                      controller: po,
                                      keyboardType: TextInputType.number,
                                    )),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      //asignacion de datos a variables

                                      act1 = a1.text;

                                      act2 = a2.text;

                                      pruO = po.text;
                                  
                                        //inicio de definicion de ingreso de datos a archivo php

                                        nie = nieEstu.text;
                                        //limpieza de campos
                                        a1.text = "";
                                        a2.text = "";
                                        po.text = "";
                                        nieEstu.text = "";
                                        //verificacion de nie si esta o no en la base
                                        if (nie != "") {
                                          dynamic respuesta = await verNie(nie);
                                          if (respuesta == "noEncontrado") {
                                            _notify(context, nie);
                                          } else {
                                            //insercion de datos en la base
                                            dynamic respuesta = await insertNP3(
                                                nie, act1, act2, pruO, materia);
                                            if (respuesta == "error") {
                                              //mensaje de que algo salio mal
                                              String sms1="!OPPPS Algo salio mal en consultasf.dart";
                                              String sms2="Vuelva A intentarlo ";
                                              _notifyM(context,sms1,sms2);
                                            } else {
                                              //mensaje de confirmacion
                                              //redirigimmiento para visualizar datos
                                              _notify1(context);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        CuadroP3(
                                                            widget.anio,
                                                            widget.seccion,
                                                            widget.materia1),
                                                  ));
                                              
                                            }
                                          }
                                        }
                                      

                                      ///fin de ingreso de datos a archivo php
                                    },
                                    child: const Center(child: Text('Guardar')),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      a1.text = "";
                                      a2.text = "";
                                      po.text = "";
                                      nieEstu.text = "";
                                    },
                                    child:
                                        const Center(child: Text('Reiniciar')),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            print(widget.anio);
                            print(widget.seccion);
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Periodos(widget.anio,
                                      widget.seccion, widget.materia1),
                                ));
                          },
                          child: const Center(child: Text('Regresar')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  void _notify(BuildContext context, String? nie) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("OPPS!\nNIE no encontrado"),
            content: Text('Ningun NIE coincide con el ingresado : $nie '),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }
//uso libre de mensaje de notificacion
  void _notifyM(BuildContext context,String sms1, String sms2) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text(sms1),
            content: Text(
                sms2),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _notify1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Datos Ingresados \n correctamente!"),
            content: const Text('Datos ingresados con exito'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }
}
