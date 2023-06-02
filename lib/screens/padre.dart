import 'dart:convert';
import 'package:control_notas/developer/consultad.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../main.dart';
import 'padre.dart';
import 'manual.dart';

void main() {
  runApp(const MyApp());
  home: const Padre(seccionp: '',gradop: '',);
}

class Padre extends StatefulWidget{
  final String seccionp;
  final String gradop;
  const Padre({super.key, required this.seccionp, required this.gradop});
  @override
  State<Padre> createState() => _PadreState();
}

class _PadreState extends State<Padre> {
List<String> nombre = [];
List<String> dui3 = [];
var reslt;

@override
void initState(){
  super.initState();
  (() async{
    reslt = await getData(widget.seccionp,widget.gradop);
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["dui"]);
    print(dato["nombre_padre"]);

  // ignore: non_constant_identifier_names
          var nom_tem = dato["dui"];
     

          // ignore: non_constant_identifier_names
          var id_tem = dato["nombre_padre"];
         

setState(() {
  // Actualizar las listas con los datos obtenidos
  nombre.add(nom_tem);
  dui3.add(id_tem);
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
            'Listado de Padres',
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
                    nombre_padre(),
                    padre(),
                  ]
                ),

                  TableRow(
                    children: [
                      nombre_padre1(),
                      padre2(),
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

  Widget padre() {
    return Container(
        color: Colors.blue,
        child: const Center(
            child: Text('Nombre',style: TextStyle(fontSize: 20),
        )));
  }

   Widget nombre_padre() {
    return Container(
        color: Colors.blue,
        child: const Center(
            child: Text(
          'Dui',
          style: TextStyle(fontSize: 20),
        )));
  }

  Widget padre2() {
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

Widget nombre_padre1() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        for (var i = 0; i < dui3.length; i++)
          Text(dui3[i], style: const TextStyle(fontSize: 20)),
      ],
    ),
  );
}

}