import 'package:flutter/material.dart';
import 'package:control_notas/screens/manual.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            image: AssetImage('assets/01.jpg'), fit: BoxFit.cover),
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
          BotonProfe(),
          espacio(),
          titulo5(),
          espacio(),
          boleta(),
          espacio(),
          espacio(),
          BotonAyuda()
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
              onPressed: () {
                // Acción del botón
              },
              child: Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 64, 65,
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
                controller: textField2Controller,
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
              onPressed: () {
                // Acción del botón
              },
              child: Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 64, 65,
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
              onPressed: () {
                // Acción del botón
              },
              child: Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 64, 65,
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
              },
              child: Text('Ver'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 64, 65,
                    66), // Cambia el color de fondo del botón a rojo
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget BotonProfe() {
    return Row(children: [
      ElevatedButton(
        onPressed: () {
          // Lógica que se ejecutará cuando se presione el botón "Guardar"
          setState(() {});
        },
        child: Text('Ver'),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(
              255, 64, 65, 66), // Cambia el color de fondo del botón a rojo
        ),
      ),
    ]);
  }

  Widget BotonAyuda() {
    return Row(children: [
      ElevatedButton(
        onPressed: () {
          // Lógica que se ejecutará cuando se presione el botón "Guardar"
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Manual()),
          );
        },
        child: Text('Ayuda'),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(
              255, 64, 65, 66), // Cambia el color de fondo del botón a rojo
        ),
      ),
    ]);
  }
}
