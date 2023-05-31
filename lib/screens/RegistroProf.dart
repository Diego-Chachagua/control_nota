import 'package:flutter/material.dart';

import 'manual.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Profesor());
  }
}

class Profesor extends StatefulWidget {
  const Profesor({super.key});

  @override
  State<Profesor> createState() => _ProfesorState();
}

class _ProfesorState extends State<Profesor> {
  String _seleccionada = 'Seleccione el Año';
  List anios = ['Seleccione el Año', '1 año', '2 año', '1 y 2 año'];
  String _seleccionada3 = 'Seleccione el genero';
  List gene = ['Seleccione el genero', 'Masculino', 'Femenino'];
  bool? ischecked = false;
  bool? ischecked2 = false;
  bool? ischecked3 = false;
  bool? ischecked4 = false;
  bool? ischecked5 = false;
  bool? ischecked6 = false;
  bool? ischecked7 = false;
  bool? ischecked8 = false;
  bool? ischecked9 = false;
  bool? ischecked10 = false;
  bool? ischecked11 = false;
  bool? ischecked12 = false;
  bool? ischecked13 = false;
  bool? ischecked14 = false;
  String informacionGuardada = '';
  String informacionCancelada = '';
  List<String> menuItems = ['A', 'B', 'G', 'F', 'H', 'K', 'L', 'O'];
  List<bool> isCheckedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
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
          title: const Text('Registro de Profesor'),
          backgroundColor: const Color(0x00E8E2E2),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/01.jpg'), fit: BoxFit.cover),
                ),
                child: Text(
                  'Secciones que dara el docente',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(menuItems[index]),
                    leading: Checkbox(
                      value: isCheckedList[index],
                      onChanged: (value) {
                        setState(() {
                          isCheckedList[index] = value!;
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
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
          crearDropdDownButton(),
          espacio(),
          titulo1(),
          checkbox(),
          checkbox2(),
          checkbox3(),
          checkbox4(),
          checkbox5(),
          checkbox6(),
          checkbox7(),
          checkbox8(),
          espacio(),
          _createInput(),
          espacio(),
          _createInput2(),
          espacio(),
          espacio(),
          botonGuardar(),
          espacio(),
          espacio(),
          BotonAyuda()
        ],
      ),
    );
  }

  Widget titulo1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Elija las materias que llevara el profesor',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Escriba el nombre del profesor',
          labelText: 'Nombre',
          helperText: 'Escriba el nombre solamente',
          suffixIcon: const Icon(Icons.account_circle)),
    );
  }

  Widget _createInput2() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Escriba el apellido del profesor',
          labelText: 'Apellido',
          helperText: 'Escriba el apellido solamente',
          suffixIcon: const Icon(Icons.account_circle)),
    );
  }

  Widget espacio() {
    return const SizedBox(
      height: 20,
    );
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton() {
    List<DropdownMenuItem<String>> annios = [];
    anios.forEach((element) {
      annios.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return annios;
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton3() {
    List<DropdownMenuItem<String>> genero = [];
    gene.forEach((element) {
      genero.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return genero;
  }

  Widget crearDropdDownButton() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 40,
            child: DropdownButton(
              value: _seleccionada,
              items: GetOptionsDropDownButton(),
              onChanged: (value) {
                setState(() {
                  _seleccionada = value.toString();
                });
              },
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Container(
            width: 20,
            child: DropdownButton(
              value: _seleccionada3,
              items: GetOptionsDropDownButton3(),
              onChanged: (value) {
                setState(() {
                  _seleccionada3 = value.toString();
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget checkbox() {
    return Row(
      children: [
        Checkbox(
          value: ischecked,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked = newBool;
            });
          },
        ),
        const Text(
          'Lenguaje',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 15),
        Checkbox(
          value: ischecked2,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked2 = newBool;
            });
          },
        ),
        const Text(
          'Sociales',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 10),
        Checkbox(
          value: ischecked3,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked3 = newBool;
            });
          },
        ),
        const Text(
          'Ciencia',
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  Widget checkbox2() {
    return Row(
      children: [
        Checkbox(
          value: ischecked4,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked4 = newBool;
            });
          },
        ),
        const Text(
          'Muci',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 35),
        Checkbox(
          value: ischecked5,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked5 = newBool;
            });
          },
        ),
        const Text(
          'Ingles',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 20),
        Checkbox(
          value: ischecked6,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked6 = newBool;
            });
          },
        ),
        const Text(
          'Matematica',
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  Widget checkbox3() {
    return Row(
      children: [
        Checkbox(
          value: ischecked7,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked7 = newBool;
            });
          },
        ),
        const Text(
          'Informatica',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 5),
        Checkbox(
          value: ischecked8,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked8 = newBool;
            });
          },
        ),
        const Text(
          'OPLV',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 22),
        Checkbox(
          value: ischecked9,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked9 = newBool;
            });
          },
        ),
        const Text(
          'Seminario',
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  Widget checkbox4() {
    return Row(
      children: [
        Checkbox(
          value: ischecked10,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked10 = newBool;
            });
          },
        ),
        const Text(
          'Curso de habilitacion para la vida',
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  Widget checkbox5() {
    return Row(
      children: [
        Checkbox(
          value: ischecked11,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked11 = newBool;
            });
          },
        ),
        const Text(
          'Evidencia actitudes favorables para la convivencia',
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  Widget checkbox6() {
    return Row(
      children: [
        Checkbox(
          value: ischecked12,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked12 = newBool;
            });
          },
        ),
        const Text(
          'Toma desiciones de forma autonoma y responsable',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget checkbox7() {
    return Row(
      children: [
        Checkbox(
          value: ischecked13,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked13 = newBool;
            });
          },
        ),
        const Text(
          'Se expresa y participa con respeto',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget checkbox8() {
    return Row(
      children: [
        Checkbox(
          value: ischecked14,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            setState(() {
              ischecked14 = newBool;
            });
          },
        ),
        const Text(
          'Muestra sentido de pertencia y respeto por nuestra cultura',
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }

  Widget botonGuardar() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // Lógica que se ejecutará cuando se presione el botón "Guardar"
            setState(() {
              informacionGuardada = 'Datos guardados';
            });
          },
          child: Text('Guardar'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Cambia el color de fondo del botón a rojo
          ),
        ),
        SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            // Lógica que se ejecutará cuando se presione el botón "Cancelar"
            setState(() {
              informacionCancelada = 'Informacion calcelada';
            });
          },
          child: Text('Cancelar'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // Cambia el color de fondo del botón a rojo
          ),
        ),
      ],
    );
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
