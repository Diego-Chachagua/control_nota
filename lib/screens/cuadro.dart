// ignore_for_file: use_build_context_synchronously

import 'package:control_notas/screens/periodo.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../developer/consultasf.dart';

class CuadroN1 extends StatefulWidget {
  String anio;
  String seccion;
  var materia1;

  CuadroN1(this.anio, this.seccion, this.materia1, {super.key});

  @override
  State<CuadroN1> createState() => _CuadroN1State();
}

class _CuadroN1State extends State<CuadroN1> {
  final nieEstu = TextEditingController();

  final a1 = TextEditingController();

  final a2 = TextEditingController();

  final po = TextEditingController();

  var nie, act1, act2, pruO;

  List<String> nombre = [];
  List<String> nie3 = [];
  List<String> apellido = [];
  List<String> act1_p1 = [];
  List<String> act2_p1 = [];
  List<String> po_p1 = [];
  List<String> promedio_p1 = [];
  var reslt;
  

  @override
  void initState() {
    super.initState();
    
    (() async {
      var grado="";
      var seccion1="";
       if (widget.anio == "1 año") {
        grado = "1";
      } else if (widget.anio == "2 año") {
        grado = "2";
      }

      if (widget.seccion == "A") {
        seccion1 = "1";
      } else if (widget.seccion == "F") {
        seccion1 = "2";
      } else if (widget.seccion == "E") {
        seccion1 = "3";
      } else if (widget.seccion == "H") {
        seccion1 = "4";
      } else if (widget.seccion == "G") {
        seccion1 = "5";
      } else if (widget.seccion == "D") {
        seccion1 = "6";
      }


      reslt = await mostrarP1(grado,seccion1);
      if (reslt != "noExisten") {
        for (var i = 0; i < reslt.length; i++) {
          var dato = reslt[i];
          
          print(dato["nombre_estudiante"]);
          print(dato["nie"]);
          print(dato["apellido_estudiante"]);
          print(dato["act1_p1"]);
          print(dato["act2_p1"]);
          print(dato["po_p1"]);
          
        print(grado);
        print(seccion1);
        print(widget.materia1);
          // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_estudiante"];
          var ape_tem = dato["apellido_estudiante"];
          var act1_p1n = dato["act1_p1"];
          var act2_p1n = dato["act2_p1"];
          var po_p1n = dato["po_p1"];
          // ignore: non_constant_identifier_names
          var id_tem = dato["nie"];

          setState(() {
            // Actualizar las listas con los datos obtenidos
            nombre.add(nom_tem);
            nie3.add(id_tem);
            apellido.add(ape_tem);
            act1_p1.add(act1_p1n);
            act2_p1.add(act2_p1n);
            po_p1.add(po_p1n);
          });
        }
      }
    })();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo_o.jpg'), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
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
                          'SECCION: "${widget.seccion}"',
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 80,
                          width: 50,
                        ),
                        Text(
                          'MATERIA: Estudios Sociales',
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
                          'PERIODO: 1',
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
                                      for (var i = 0; i < act1_p1.length; i++)
                                        Text(act1_p1[i],
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
                                      for (var i = 0; i < act2_p1.length; i++)
                                        Text(act2_p1[i],
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
                                      for (var i = 0; i < po_p1.length; i++)
                                        Text(po_p1[i],
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
                                          i < promedio_p1.length;
                                          i++)
                                        Text(promedio_p1[i],
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
                                      //verifica que campos estan vacios
                                      if (a1.text != "") {
                                        act1 = a1.text;
                                      }
                                      if (a2.text != "") {
                                        act2 = a2.text;
                                      }
                                      if (po.text != "") {
                                        pruO = po.text;
                                      }
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
                                          dynamic respuesta = await insertNP1(
                                              nie, act1, act2, pruO);
                                          if (respuesta == "noEncontrado") {
                                            _notifyM(context);
                                          } else {
                                            //mensaje de confirmacion
                                            _notify1(context);
                                          }
                                        }
                                      }
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
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> Periodos(anio,seccion)));
                          },
                          child: const Center(child: Text('Regresar')),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
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

  void _notifyM(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Algo salio mal"),
            content: Text('!OPPS  ALGO SALIO MAL EN LA INSERCION '),
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
