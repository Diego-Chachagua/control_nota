import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'hijos.dart';
import 'manual.dart';

void main() {
  runApp(const MyApp());
  home: const Estudiantes(seccione1: '',gradoe1: '',);
}

class Estudiantes extends StatefulWidget{
  final String seccione1;
  final String gradoe1;
  const Estudiantes({super.key, required this.seccione1, required this.gradoe1});
  @override
  State<Estudiantes> createState() => _EstudiantesState();
}

class _EstudiantesState extends State<Estudiantes> {
List<String> nombre = [];
List<String> nie3 = [];
var reslt;

@override
void initState(){
  super.initState();
  (() async{
    reslt = await enviare(widget.seccione1,widget.gradoe1);
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["nombre_estudiante"]);
    print(dato["nie"]);

  // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_estudiante"];
     

          // ignore: non_constant_identifier_names
          var id_tem = dato["nie"];
         

setState(() {
  // Actualizar las listas con los datos obtenidos
  nombre.add(nom_tem);
  nie3.add(id_tem);
});
  }
    }
  })();
}


  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/imagen1.jpeg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: const Center(
              child: Text(
            'CONTROL DE NOTAS',
            style: TextStyle(fontSize: 30),
          )),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
            child: Table(
              columnWidths: const {0: FractionColumnWidth(0.5)},
              border: TableBorder.all(),
              children:  [
                TableRow(
                  children: [
                    nie(),
                    hijos(),
                  ]
                ),

                  TableRow(
                    children: [
                      nie1(),
                      hijo1(),
                    ]
                  ),
              ],
            ),
            )
          ],
        )
      ),
    );
  }

  Widget hijos() {
    return Container(
        color: Colors.blue,
        child: const Center(
            child: Text('Hijos',style: TextStyle(fontSize: 20),
        )));
  }

   Widget nie() {
    return Container(
        color: Colors.blue,
        child: const Center(
            child: Text(
          'Nie',
          style: TextStyle(fontSize: 20),
        )));
  }

  Widget hijo1() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        
        for (var i = 0; i < nombre.length; i++)
          Text(nombre[i], style: const TextStyle(fontSize: 20)),
      ],
    ),
  );
}

Widget nie1() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        for (var i = 0; i < nie3.length; i++)
          Text(nie3[i], style: const TextStyle(fontSize: 20)),
      ],
    ),
  );
}

}