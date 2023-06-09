import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:collection';

import '../developer/consultaso.dart';
import 'boleta2.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Hijos(duibd1: ''),
  ));
}

class Hijos extends StatefulWidget {
  final String duibd1;
  const Hijos({Key? key, required this.duibd1}) : super(key: key);
  
  @override
  State<Hijos> createState() => _HijosState();
  
}

class _HijosState extends State<Hijos> {
  TextEditingController nies = TextEditingController();
  String bastar = '';
  List<String> nombre = [];
  List<String> nie3 = [];
  var reslt;
  
  @override
  void initState() {
    super.initState();
    (() async {
      reslt = await enviardui(widget.duibd1);
      if (reslt != "noExisten") {
        for (var i = 0; i < reslt.length; i++) {
          var dato = reslt[i];
          print(dato["nombre_estudiante"]);
          print(dato["nie"]);

          var nom_tem = dato["nombre_estudiante"];
          var id_tem = dato["nie"];

          setState(() {
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
          image: AssetImage('assets/imagen1.jpeg'),
          fit: BoxFit.cover,
        ),
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
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: const {0: FractionColumnWidth(0.5)},
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      hijos(),
                      nie(),
                    ],
                  ),
                  TableRow(
                    children: [
                      hijo1(),
                      nie1(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            nieb(),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 107, 107, 107),
              onPressed: () {
                bastar = nies.text;
                generatePdf2(bastar);
              },
              child: const Text(
                'Ver boleta',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hijos() {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Hijos',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget nie() {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Nie',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget hijo1() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          for (var i = 0; i < nombre.length; i++)
            Text(
              nombre[i],
              style: const TextStyle(fontSize: 20),
            ),
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
            Text(
              nie3[i],
              style: const TextStyle(fontSize: 20),
            ),
        ],
      ),
    );
  }

  Widget nieb() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
      child: Container(
        color: Colors.white,
        child: TextField(
          controller: nies,
          decoration: InputDecoration(
            counterStyle: TextStyle(color: Colors.white),
            hintText: "Nie del alumno a ver boleta",
          ),
        ),
      ),
    );
  }
}
