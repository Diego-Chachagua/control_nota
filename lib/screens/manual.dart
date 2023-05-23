import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Manual());
  }
}

class Manual extends StatefulWidget {
  const Manual({super.key});

  @override
  State<Manual> createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  bool expanded1 = false;
  bool expanded2 = false;
  bool expanded3 = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondo.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: const Text('¿Como ingresar?'),
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
    return Container(
      child: Column(children: <Widget>[
        titulo1(),
        espacio(),
        espacio(),
        espacio(),
        titulo2(),
        acordeon(),
      ]),
    );
  }

  Widget espacio() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget titulo1() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'ATENCION',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'BIENVENIDOS',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'a nuestro nuevo sitio web',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Ayuda y atencion al personal docente',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'y padres de familia, toda la ayuda que ',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'necesita se encuentra aqui!',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'NO SABES COMO INICIAR SESION',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'COMO PADRE DE FAMILIA,',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'ADMINITRADOR O DOCENTE?,',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'MUY FACIL CON ESTE SIMPLE',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                SizedBox(height: 8.0),
                const Text(
                  ' MANUAL DE GUIA LO SABRAS RAPIDO',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/manual.png',
            width: 130,
            height: 150,
          ),
        ],
      ),
    );
  }

  Widget titulo2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('MANUAL DE USUARIO',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget acordeon() {
    return Column(
      children: [
        _buildAccordion(1, '¿Eres padre de familia?', expanded1, [
          Text(
              '2-Despues lo llevara a un formulario que tendra que llenar con su usuario, dui y contraseña el usuario y contraseña se lo brindara el director de la institucion'),
          Image.asset(
            'assets/27.jpg',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text('Texto 2'),
          Image.asset(
            'assets/27.jpg',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ]),
        _buildAccordion(2, '¿Eres el docente?', expanded2, [
          Text('Texto 3'),
          Image.asset(
            'assets/27.jpg',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text('Texto 4'),
          Image.asset(
            'assets/27.jpg',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ]),
        _buildAccordion(3, '¿Eres el administrador?', expanded3, [
          Text('Texto 5'),
          Image.asset(
            'assets/27.jpg',
            height: 120.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Text('Texto 6'),
          Image.asset(
            'assets/27.jpg',
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ]),
      ],
    );
  }

  Widget _buildAccordion(
      int index, String title, bool expanded, List<Widget> content) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (index) {
            case 1:
              expanded1 = !expanded1;
              break;
            case 2:
              expanded2 = !expanded2;
              break;
            case 3:
              expanded3 = !expanded3;
              break;
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(8.0),
        child: Card(
          color: expanded
              ? Color.fromARGB(255, 66, 17, 204)
              : Color.fromARGB(255, 108, 108, 181),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: expanded
                            ? Color.fromARGB(255, 242, 238, 238)
                            : Color.fromARGB(255, 9, 9, 9),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 24.0,
                    ),
                  ],
                ),
              ),
              if (expanded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: content,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
