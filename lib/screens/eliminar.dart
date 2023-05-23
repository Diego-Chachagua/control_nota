// ignore_for_file: avoid_print

import 'package:control_notas/developer/consultad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
        debugShowCheckedModeBanner: false, home: EliminarDatos());
  }
}

class EliminarDatos extends StatefulWidget {
  const EliminarDatos({super.key});

  @override
  State<EliminarDatos> createState() => _EliminarDatosState();
}

class _EliminarDatosState extends State<EliminarDatos> {
  String usu = '';
  String usu2 = '';
  String _seleccionada = 'Seleccione una opcion';
  List opcion = ['Seleccione una opcion', 'Maestro', 'Estudiante', 'Padre'];
  TextEditingController _controller = TextEditingController();
  final _numberOnlyFormatter = FilteringTextInputFormatter.digitsOnly;
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
          title: const Text('Eliminar Datos'),
          backgroundColor: const Color(0x00E8E2E2),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          children: <Widget>[Cuerpo()],
        ),
      ),
    );
  }

  Widget Cuerpo() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        children: <Widget>[
          DropdDown(),
          espacio(),
          espacio(),
          _createInput(),
          espacio(),
          espacio(),
          Boton()
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton() {
    List<DropdownMenuItem<String>> opciones = [];
    opcion.forEach((element) {
      opciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return opciones;
  }

  Widget DropdDown() {
    return Row(children: <Widget>[
     const SizedBox(width: 1),
      DropdownButton(
        value: _seleccionada,
        items: GetOptionsDropDownButton(),
        onChanged: (value) {
          setState(() {
            usu2 = _seleccionada = value.toString();
          });
        },
      ),
    ]);
  }

  Widget espacio() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget _createInput() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: _controller,
        inputFormatters: [_numberOnlyFormatter],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          fillColor: Colors.grey[200],
          filled: true,
          hintText:
              'Escriba el nie, dui o codigo del docente que deseas eliminar',
          labelText: 'NIE/DUI/CODIGO',
          helperText: 'Escriba el nie, dui o codigo del docente solamente',
        ),
        style: const TextStyle(fontSize: 12.0),
      ),
    );
  }

  Widget Boton() {
    return Row(children: [
      ElevatedButton(
        onPressed: () async {
          // Lógica que se ejecutará cuando se presione el botón "Guardar"
          usu = _controller.text;
          usu2;
          print(usu);
          print(usu2);
          _controller.text = '';
          await eliminarUsu(usu, usu2);
          setState(() {});
        },
        child: Text('Eliminar'),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(
              255, 222, 10, 10), // Cambia el color de fondo del botón a rojo
        ),
      ),
    ]);
  }
}
