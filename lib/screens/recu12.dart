// ignore_for_file: use_build_context_synchronously

import 'package:control_notas/screens/periodo.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../developer/consultasf.dart';

class Recupera1A extends StatefulWidget {
  String anio;
  String seccion;
  var materia1;

  Recupera1A(this.anio, this.seccion, this.materia1, {super.key});

  @override
  State<Recupera1A> createState() => _Recupera1AState();
}

class _Recupera1AState extends State<Recupera1A> {
  final nieEstu = TextEditingController();

  final a1 = TextEditingController();

  final a2 = TextEditingController();

  final po = TextEditingController();

  var nie, act1, act2, pruO;

  List<String> nombre = [];
  List<String> nie3 = [];
  List<String> apellido = [];
  List<String> re1 = [];
  List<String> re2 = [];
  
  List<String> promedio_f = [];
  List<String> promedio_p = [];
  List<String> result = [];
  

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

      reslt = await mostrarRe1(1, seccion1, materia);
      if (reslt != "noExisten") {
        for (var i = 0; i < reslt.length; i++) {
          var dato = reslt[i];
          //variables utilizadas para guardar los datos extraidos de la base
          var re1;
          var re2;
          var avanzo;

          print(dato["nombre_estudiante"]);
          print(dato["nie"]);
          print(dato["apellido_estudiante"]);
          print(dato["promedio_p1"]);
          print(dato["promedio_p2"]);
          print(dato["promedio_p3"]);
          print(dato["promedio_p4"]);
          print(dato["re1"]);
          print(dato["re2"]);
          
          print(grado);
          print(seccion1);
          print(widget.materia1);
          // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_estudiante"];
          var ape_tem = dato["apellido_estudiante"];
          if (dato["re1"] != null) {
            re1 = dato["re1"];
          } else {
            re1= "0";
          }

          if (dato["re2"] != null) {
            re2 = dato["re2"];
          } else {
            re2 = "0";
          }

         
          //pasar valores de variables de la base a variables var de tipo int para el calculo
          
          var r1=int.parse(re1);
          var r2=int.parse(re2);
          
          var promedioca;//promedio con avanzo 
          var promediof;//promedio final
          //asginacion y comvercion de datos para el calculo de promedio
          var promediop1=dato["promedio_p1"];
          var promediop2=dato["promedio_p2"];
          var promediop3=dato["promedio_p3"];
          var promediop4=dato["promedio_p4"];
          var promedio1 = int.parse(promediop1);
          var promedio2 = int.parse(promediop2);
          var promedio3 = int.parse(promediop3);
          var promedio4 = int.parse(promediop4);
          
          var promediop = (promedio1+promedio2+promedio3+promedio4)/4;//calculo del promedio inicial 
           if(promediop<6){
            if(r1!=0){
              promedioca=(promediop+r1)/2;
            }else{
              promedioca=promediop;
            }
           }else{
            promedioca=promediop;
           }
           if(promedioca<6){
            if(r2!=0){
              promediof=(promedioca+re2)/2;


            }else{
              promediof=promedioca;
            }
           }else{
            promediof=promedioca;
           }
          
          var notac;
          if(promediof>5){
            notac="Aprobado";
          }else if(promediof<=5){
            notac="Reprobado";
          }


          
          // ignore: non_constant_identifier_names
          var id_tem = dato["nie"];

          setState(() {
            // Actualizar las listas con los datos obtenidos
            nombre.add(nom_tem);
            nie3.add(id_tem);
            apellido.add(ape_tem);
            re1.add(re1);
            re2.add(re2);
            
            promedio_p.add(promediop.toStringAsFixed(1));
            promedio_f.add(promediof.toStringAsFixed(1));
            result.add(notac);
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
                          'GRADO: "2° año"',
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
                          'Recuperaciones\n Extraordinarias',
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
                          0: FractionColumnWidth(0.05),
                          1: FractionColumnWidth(0.13),
                          2: FractionColumnWidth(0.28),
                          3: FractionColumnWidth(0.06),
                          4: FractionColumnWidth(0.06),
                          5: FractionColumnWidth(0.06),
                          6: FractionColumnWidth(0.06),
                          
                          7: FractionColumnWidth(0.15),
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
                                  child: Text('PP'),
                                )),
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('R1'),
                                )),
                            
                            Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('R2'),
                                )),
                                Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('PF'),
                                )),
                                Container(
                                height: 20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text('Resultado'),
                                )),
                          ])
                        ]),
                    //inicio de definicon de tabla para datos desde la base

                    Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const {
                          0: FractionColumnWidth(0.05),
                          1: FractionColumnWidth(0.13),
                          2: FractionColumnWidth(0.28),
                          3: FractionColumnWidth(0.06),
                          4: FractionColumnWidth(0.06),
                          5: FractionColumnWidth(0.06),
                          6: FractionColumnWidth(0.06),
                          
                          7: FractionColumnWidth(0.15),
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
                                      for (var i = 0; i < promedio_p.length; i++)
                                        Text(promedio_p[i],
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
                                      for (var i = 0; i < re1.length; i++)
                                        Text(re1[i],
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
                                          i < re2.length;
                                          i++)
                                        Text(re2[i],
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
                                          i < promedio_f.length;
                                          i++)
                                        Text(promedio_f[i],
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
                                          i < result.length;
                                          i++)
                                        Text(result[i],
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
                                    'Recuperacion \n Extraordinaria 1:',
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
                                    'Recuperacion \n Extraordinaria 2:',
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
                                        
                                        
                                        po.text = "";
                                        nieEstu.text = "";
                                        //verificacion de nie si esta o no en la base
                                        if (nie != "") {
                                          dynamic respuesta = await verNie(nie);
                                          if (respuesta == "noEncontrado") {
                                            _notify(context, nie);
                                          } else {
                                            //insercion de datos en la base
                                            dynamic respuesta = await insertRe1(
                                                nie, act1, pruO, materia);
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
                                                        Recupera1A(
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
