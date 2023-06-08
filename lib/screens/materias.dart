// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';

import '../developer/consultasf.dart';
import 'dart:core';

import 'elec_ayc.dart';
class Materias extends StatelessWidget {
  const Materias({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Materia(
        usuariobd1: '',
        contrabd1: '',
      ),
    );
  }
}

class Materia extends StatefulWidget {
  String usuariobd1;
  String  contrabd1;
   Materia({super.key,required this.usuariobd1,required this.contrabd1});

  @override
  State<Materia> createState() => _MateriaState();
}

class _MateriaState extends State<Materia> {
  dynamic dato1;
  dynamic dato2;
  dynamic dato3;
  dynamic dato4;
  dynamic materia;
  bool isButtonEnabled = false;
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
          children: <Widget>[cuerpo()],
        ),
      ),
    );
  }

  Widget cuerpo() {
    return Container(
      child: Column(
        children: <Widget>[
          titul(),
          titulo(),
          espacio(),
          espacio(),
          botones1(),
          espacio(),
          botones2(),
          espacio(),
          botones3(),
          espacio(),
          botones4(),
          espacio(),
          botones5()
        ],
      ),
    );
  }

  Widget titul() {
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

  Widget titulo() {
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
  

  Widget botones1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/quimica1.png'),
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '3' || dato2 == '3' || dato3 == '3' || dato4 == '3')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 3;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '5' || dato2 == '5' || dato3 == '5' || dato4 == '5')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 5;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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

  Widget botones2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/sociales1.png'),
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '4' || dato2 == '4' || dato3 == '4' || dato4 == '4')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 4;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '6' || dato2 == '6' || dato3 == '6' || dato4 == '6')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 6;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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

  Widget botones3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/oplv1.png'),
             onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '9' || dato2 == '9' || dato3 == '9' || dato4 == '9')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 9;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '2' || dato2 == '2' || dato3 == '2' || dato4 == '2')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 2;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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

  Widget botones4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/lenguaje1.png'),
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '1' || dato2 == '1' || dato3 == '1' || dato4 == '1')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '7' || dato2 == '7' || dato3 == '7' || dato4 == '7')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 7;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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

  Widget botones5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              iconSize: 94,
              icon: Image.asset('assets/seminario1.png'),
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '9' || dato2 == '9' || dato3 == '9' || dato4 == '9')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 9;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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
              onPressed: () async {
                print(widget.contrabd1);
                dynamic respuesta = await buscarCode(widget.usuariobd1, widget.contrabd1);
                print(respuesta);

                if (respuesta != null) {
                  dato1 = respuesta['cod_1'];
                  dato2 = respuesta['cod_2'];
                  dato3 = respuesta['cod_3'];
                  dato4 = respuesta['cod_4'];
                }
                if (!(dato1 == '10' || dato2 == '10' || dato3 == '10' || dato4 == '10')) {
                  // Si no se cumple la condición, el botón se desactiva
                  setState(() {
                    isButtonEnabled = false;
                  });
                } else {
                  // Si se cumple la condición, el botón se habilita y se navega a la siguiente pantalla
                  setState(() {
                    isButtonEnabled = true;
                  });
                  materia = 10;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleccionAyC(materia1: materia)),
                  );
                }
                // Widget del botón
                IconButton(
                  iconSize: 94,
                  icon: Image.asset('#'),
                  onPressed: isButtonEnabled ? () {} : null, // Si el botón está deshabilitado, onPressed es nulo
                );
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
