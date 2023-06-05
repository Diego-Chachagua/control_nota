// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:control_notas/screens/usuycontra.dart';
import 'package:flutter/material.dart';
import 'package:control_notas/screens/manual.dart';
import 'dart:typed_data';

import '../developer/consultad.dart';
import 'consultaprofe.dart';
import 'estudiantes.dart';

import 'boleta1.dart';
import 'padre.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VerUsuarios(),
    );
  }
}

class VerUsuarios extends StatefulWidget {
  const VerUsuarios({super.key});

  @override
  State<VerUsuarios> createState() => _VerUsuariosState();
}

class _VerUsuariosState extends State<VerUsuarios> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();
  TextEditingController textField3Controller = TextEditingController();
  TextEditingController textField4Controller = TextEditingController();
  TextEditingController textField5Controller = TextEditingController();
  TextEditingController textField6Controller = TextEditingController();
  TextEditingController textField7Controller = TextEditingController();
  String seccionprofe = '';
  String gradoprofe = '';
  String seccione = '';
  String gradoe = '';
  String seccionu = '';
  String gradou = '';

  @override
  void dispose() {
    textField1Controller.dispose();
    textField2Controller.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondo_o.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Consultas'),
          backgroundColor: const Color(0x00E8E2E2),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          children: <Widget>[cuerpo()],
        ),
      ),
    );
  }

  Widget cuerpo() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: <Widget>[
          espacio(),
          titulo1(),
          espacio(),
          usuarios(),
          espacio(),
          titulo2(),
          espacio(),
          estudiantes(),
          espacio(),
          titulo3(),
          espacio(),
          padres(),
          espacio(),
          titulo4(),
          espacio(),
          botonProfe(),
          espacio(),
          titulo5(),
          espacio(),
          boleta(),
          espacio(),
          espacio(),
          botonAyuda()
        ],
      ),
    );
  }

  Widget espacio() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget titulo1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ver Usuarios',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget titulo2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ver Estudiantes',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget titulo3() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ver Padres',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget titulo4() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ver Profesores',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget titulo5() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Ver Boleta',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget usuarios() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                controller: textField1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Año',
                  labelText: 'Grado',
                  helperText: 'solo el año',
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Espacio entre los campos de texto y el botón
            Expanded(
              flex: 2,
              child: TextField(
                controller: textField7Controller,
                maxLength: 1,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Seccion',
                  labelText: 'Seccion',
                  helperText: 'solo la seccion',
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Espacio entre los campos de texto y el botón
            ElevatedButton(
              onPressed: () async{
                seccionu = textField7Controller.text;
                gradou = textField1Controller.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   Usuycontra(seccione2: seccionu, gradoe2: gradou)),
                   );
              },
              child: const Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 64, 65,
                    66), // Cambia el color de fondo del botón a rojo
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget estudiantes() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                controller: textField6Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Año',
                  labelText: 'Grado',
                  helperText: 'solo el año',
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Espacio entre los campos de texto y el botón
            Expanded(
              flex: 2,
              child: TextField(
                controller: textField2Controller,
                maxLength: 1,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Seccion',
                  labelText: 'Seccion',
                  helperText: 'solo la seccion',
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Espacio entre los campos de texto y el botón
            ElevatedButton(
              onPressed: () async{
                seccione = textField2Controller.text;
                gradoe = textField6Controller.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   Estudiantes(seccione1: seccione, gradoe1: gradoe)),
                   );
              },
              child: const Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 64, 65,
                    66), // Cambia el color de fondo del botón a rojo
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget padres() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                controller: textField3Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Año',
                  labelText: 'Grado',
                  helperText: 'solo el año',
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Espacio entre los campos de texto y el botón
            Expanded(
              flex: 2,
              child: TextField(
                maxLength: 1,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                controller: textField5Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Seccion',
                  labelText: 'Seccion',
                  helperText: 'solo la seccion',
                ),
              ),
            ),
            const SizedBox(
                width: 16.0), // Espacio entre los campos de texto y el botón
            ElevatedButton(
             onPressed: () async{
                seccionprofe = textField5Controller.text;
                gradoprofe = textField3Controller.text;
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   Padre(seccionp: seccionprofe, gradop: gradoprofe)),
                   );
              },
              child: const Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 64, 65,
                    66), // Cambia el color de fondo del botón a rojo
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget boleta() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TextField(
                controller: textField4Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'nie',
                  labelText: 'NIE',
                  helperText: 'solo el nie',
                ),
              ),
            ),
            const SizedBox(
                width:
                    126.0), // Espacio entre los campos de texto y el botón// Espacio entre los campos de texto y el botón
            ElevatedButton(
              onPressed: () {
                // Acción del botón
                generatePdf();
              },
              child: const Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 64, 65,
                    66), // Cambia el color de fondo del botón a rojo
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botonProfe() {
    return Row(children: [
      ElevatedButton(
        onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Datos()));
          setState(() {});
        },
        child: const Text('Ver'),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(
              255, 64, 65, 66), // Cambia el color de fondo del botón a rojo
        ),
      ),
    ]);
  }

  Widget botonAyuda() {
    return Row(children: [
      ElevatedButton(
        onPressed: () {
          // Lógica que se ejecutará cuando se presione el botón "Guardar"
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Manual()),
          );
        },
        child: const Text('Ayuda'),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(
              255, 64, 65, 66), // Cambia el color de fondo del botón a rojo
        ),
      ),
    ]);
  }

}
