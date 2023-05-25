import 'package:flutter/material.dart';
import 'package:control_notas/screens/manual.dart';


class Registro extends StatelessWidget {
  const Registro({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Estudiante());
  }
}

class Estudiante extends StatefulWidget {
  const Estudiante({super.key});

  @override
  State<Estudiante> createState() => _EstudianteState();
}

class _EstudianteState extends State<Estudiante> {
  String _seleccionada = 'Año';
  List anios = ['Año', '1 año', '2 año', '1 y 2 año'];
  String _seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'B', 'f', 'G', 'H', 'K'];
  String _seleccionada3 = 'Genero';
  List gene = ['Genero', 'Masculino', 'Femenino'];
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
  TextEditingController _controller = TextEditingController();
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();

  @override
  void dispose() {
    textField1Controller.dispose();
    textField2Controller.dispose();
    super.dispose();
  }

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
          title: const Text('Registro de Alumno y Padre'),
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
          _createInput3(),
          espacio(),
          _createInput4(),
          espacio(),
          _createInput5(),
          espacio(),
          _createInput6(),
          espacio(),
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
      children: [
        Text('Elija las materias que llevara el alumno',
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
          hintText: 'Escriba el nombre del alumno',
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
          hintText: 'Escriba el apellido del alumno',
          labelText: 'Apellido',
          helperText: 'Escriba el apellido solamente',
          suffixIcon: const Icon(Icons.account_circle)),
    );
  }

  Widget _createInput3() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Escriba el nombre del padre',
          labelText: 'Nombre',
          helperText: 'Escriba el nombre del padre',
          suffixIcon: const Icon(Icons.account_circle)),
    );
  }

  Widget _createInput4() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Escriba el apellido del padre',
          labelText: 'Apellido',
          helperText: 'Escriba el apellido solamente',
          suffixIcon: const Icon(Icons.account_circle)),
    );
  }

  Widget _createInput5() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
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
                  hintText: 'Dui',
                  labelText: 'Dui ',
                  helperText: 'Escriba el dui del padre ',
                ),
              ),
            ),
            SizedBox(
                width:
                    140.0), // Espacio entre los campos de texto y el botón// Espacio entre los campos de texto y el botón
          ],
        ),
      ),
    );
  }

  Widget _createInput6() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
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
                  hintText: 'Nie',
                  labelText: 'Nie',
                  helperText: 'Escriba el nie del Alumno',
                ),
              ),
            ),
            const SizedBox(
                width:
                    140.0), // Espacio entre los campos de texto y el botón// Espacio entre los campos de texto y el botón
          ],
        ),
      ),
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

  List<DropdownMenuItem<String>> GetOptionsDropDownButton2() {
    List<DropdownMenuItem<String>> secciones = [];
    seccion.forEach((element) {
      secciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return secciones;
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
        SizedBox(width: 1),
        DropdownButton(
          value: _seleccionada,
          items: GetOptionsDropDownButton(),
          onChanged: (value) {
            setState(() {
              _seleccionada = value.toString();
            });
          },
        ),
        SizedBox(width: 29),
        DropdownButton(
          value: _seleccionada2,
          items: GetOptionsDropDownButton2(),
          onChanged: (value) {
            setState(() {
              _seleccionada2 = value.toString();
            });
          },
        ),
        SizedBox(width: 29),
        DropdownButton(
          value: _seleccionada3,
          items: GetOptionsDropDownButton3(),
          onChanged: (value) {
            setState(() {
              _seleccionada3 = value.toString();
            });
          },
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
        Text(
          'Lenguaje',
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(width: 15),
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
        Text(
          'Sociales',
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(width: 5),
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
        Text(
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
        Text(
          'Muci',
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(width: 40),
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
        Text(
          'Ingles',
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(width: 17),
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
        Text(
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
        Text(
          'Informatica',
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(width: 5),
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
        Text(
          'OPLV',
          style: TextStyle(fontSize: 13),
        ),
        SizedBox(width: 15),
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
        Text(
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
        Text(
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
        Text(
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
        Text(
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
        Text(
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
        Text(
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
          Navigator.push(context,MaterialPageRoute(builder: (context) => Manual()), );
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
