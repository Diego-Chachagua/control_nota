import 'package:flutter/material.dart';

class Materias extends StatelessWidget {
  const Materias({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Materia(),
    );
  }
}

class Materia extends StatefulWidget {
  const Materia({super.key});

  @override
  State<Materia> createState() => _MateriaState();
}

class _MateriaState extends State<Materia> {
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          children: <Widget>[Cuerpo()],
        ),
      ),
    );
  }

  Widget Cuerpo() {
    return Container(
      child: Column(
        children: <Widget>[
          Titul(),
          Titulo(),
          espacio(),
          espacio(),
          Botones1(),
          espacio(),
          Botones2(),
          espacio(),
          Botones3(),
          espacio(),
          Botones4(),
          espacio(),
          Botones5()
        ],
      ),
    );
  }

  Widget Titul() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        child: const Text(
          'Seleccione una materia',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget Titulo() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(0),
        child: const Text(
          '¿Que materia desea escoger?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget espacio() {
    return const SizedBox(height: 16);
  }

  Widget Botones1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/quimica1.png'),
              onPressed: () {
                // Lógica cuando se presiona el primer botón
              },
            ),
            const Text(
              'CIENCIAS',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(width: 36),
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/muci.png'),
              onPressed: () {
                // Lógica cuando se presiona el segundo botón
              },
            ),
            const Text(
              'MUCI',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget Botones2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/sociales1.png'),
              onPressed: () {
                // Lógica cuando se presiona el primer botón
              },
            ),
            const Text(
              'SOCIALES',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(width: 36),
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/ingles1.png'),
              onPressed: () {
                // Lógica cuando se presiona el segundo botón
              },
            ),
            const Text(
              'INLGES',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget Botones3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/oplv1.png'),
              onPressed: () {
                // Lógica cuando se presiona el primer botón
              },
            ),
            const Text(
              'OPLV',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(width: 36),
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/mate.png'),
              onPressed: () {
                // Lógica cuando se presiona el segundo botón
              },
            ),
            const Text(
              'MATEMATICA',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget Botones4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/lenguaje1.png'),
              onPressed: () {
                // Lógica cuando se presiona el primer botón
              },
            ),
            const Text(
              'LENGUAJE',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(width: 36),
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/info3.png'),
              onPressed: () {
                // Lógica cuando se presiona el segundo botón
              },
            ),
            const Text(
              'INFORMATICA',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }

  Widget Botones5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/seminario1.png'),
              onPressed: () {
                // Lógica cuando se presiona el primer botón
              },
            ),
            const Text(
              'SEMINARIO',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(width: 36),
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/hpp1.png'),
              onPressed: () {
                // Lógica cuando se presiona el segundo botón
              },
            ),
            const Text(
              'HPP',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
