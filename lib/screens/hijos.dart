import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
import 'dart:collection';

// ignore: unused_import
import 'dart:io';
import '../developer/consultaso.dart';
import 'boleta2.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Hijos(
      duibd1: '',
    ),
  ));
}

class Hijos extends StatefulWidget {
  final String duibd1;
  const Hijos({super.key, required this.duibd1});

  @override
  State<Hijos> createState() => _HijosState();
}

class _HijosState extends State<Hijos> {
  var nombre = [];
  var nie3 = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    String url = 'https://notasincas.000webhostapp.com/hijos1.php';

    http.Response response = await http.get(Uri.parse(url));
    var resultado = jsonDecode(response.body);

    for (var i = 0; i < resultado.length; i++) {
      var dato = resultado[i];
      print(dato["nombre_estudiante"]);
      print(dato["nie"]);

      // ignore: non_constant_identifier_names
      var nom_tem = dato["nombre_estudiante"];
      nombre.add(nom_tem);

      // ignore: non_constant_identifier_names
      var id_tem = dato["nie"];
      nie3.add(id_tem);
    }
  }

//-----------codigo pantalla

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
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: const {0: FractionColumnWidth(0.5)},
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    hijos(),
                    nie(),
                  ]),
                  TableRow(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      children: [
                        hijo1(),
                        nie1(),
                      ]),
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
                generatePdf;
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
        child: Center(
            child: Text(
          widget.duibd1,
          style: const TextStyle(fontSize: 20),
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
    return Column();
  }

  Widget nie1() {
    return const Center(
        child: Text(
      '01828733-1',
      style: TextStyle(fontSize: 20),
    ));
  }

  Widget nieb() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
      child: Container(
        color: Colors.white,
        child: const TextField(
          decoration: InputDecoration(
            counterStyle: TextStyle(color: Colors.white),
            hintText: "Nie del alumno a ver boleta",
          ),
        ),
      ),
    );
  }
}
