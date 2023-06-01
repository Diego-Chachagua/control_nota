// ignore: avoid_print
// ignore_for_file: avoid_print, unused_field, prefer_final_fields, avoid_function_literals_in_foreach_calls, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:control_notas/screens/manual.dart';

import '../developer/consultad.dart';


class Registro extends StatelessWidget {
  const Registro({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Estudiante());
  }
}

class Estudiante extends StatefulWidget {
  const Estudiante({super.key});

  @override
  State<Estudiante> createState() => _EstudianteState();
}

class _EstudianteState extends State<Estudiante> {
  String grado = '' ;
  String secciones = '' ;
  String genero = '' ;
  String _seleccionada = 'Año';
  List anios = ['Año', '1', '2',];
  String _seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'F', 'E', 'H', 'G', 'D'];
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
  TextEditingController nombre1 = TextEditingController();
  TextEditingController apellido1 = TextEditingController();
  TextEditingController nombre2 = TextEditingController();
  TextEditingController apellido2 = TextEditingController();
  String estudianten = '';
  String estudiantea = '';
  String padren = '';
  String padrea = '';
  String dui = '';
  String nie = '';
  String m1 = '';
  String m2 = '';
  String m3 = '';
  String m4 = '';
  String m5 = '';
  String m6 = '';
  String m7 = '';
  String m8 = '';
  String m9 = '';
  String m10 = '';
  String materia1 = '';
  String materia2 = '';
  String materia3 = '';
  String materia4 = '';
  String materia5 = '';
  String materia6 = '';
  String materia7 = '';
  String materia8 = '';
  String materia9 = '';
  String materia10 = '';
  String seccion1 = '';
  String g = '';
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
          crearDropdDownButton(),
          espacio(),
          titulo1(),
          checkbox(),
          checkbox2(),
          checkbox3(),
          checkbox4(),
          // checkbox5(),
          // checkbox6(),
          // checkbox7(),
          // checkbox8(),
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
          botonAyuda()
        ],
      ),
    );
  }

  Widget titulo1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Elija las materias que llevara el alumno',
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ],
    );
  }

  Widget _createInput() {
    return TextField(
      controller: nombre1,
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
      controller: apellido1,
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
      controller: nombre2,
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
      controller: apellido2,
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
                  hintText: 'Dui',
                  labelText: 'Dui ',
                  helperText: 'Escriba el dui del padre ',
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

  Widget _createInput6() {
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

  List<DropdownMenuItem<String>> getOptionsDropDownButton() {
    List<DropdownMenuItem<String>> annios = [];
    anios.forEach((element) {
      annios.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return annios;
  }

  List<DropdownMenuItem<String>> getOptionsDropDownButton2() {
    List<DropdownMenuItem<String>> secciones = [];
    seccion.forEach((element) {
      secciones.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return secciones;
  }

  List<DropdownMenuItem<String>> getOptionsDropDownButton3() {
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
        const SizedBox(width: 1),
        DropdownButton(
          value: _seleccionada,
          items: getOptionsDropDownButton(),
          onChanged: (value) {
            setState(() {
              grado = _seleccionada = value.toString();

            });
          },
        ),
        const SizedBox(width: 29),
        DropdownButton(
          value: _seleccionada2,
          items: getOptionsDropDownButton2(),
          onChanged: (value) {
            secciones = _seleccionada2 = value.toString();
              if (secciones == 'A') {
                seccion1 = '1';
              }
              if (secciones == 'F') {
                seccion1 = '2';
              }
              if (secciones == 'E') {
                seccion1 = '3';
              }
              if (secciones == 'H') {
                seccion1 = '4';
              }
              if (secciones == 'G') {
                seccion1 = '5';
              }
              if (secciones == 'D') {
                seccion1 = '6';
              }
            setState(() {

            });
          },
        ),
        const SizedBox(width: 29),
        DropdownButton(
          value: _seleccionada3,
          items: getOptionsDropDownButton3(),
          onChanged: (value) {
            setState(() {
              g = _seleccionada3 = value.toString();
              if (g == 'Masculino') {
                genero = 'M';
              }else{
                genero = 'F';
              }
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
              if(ischecked == true){
                materia1 = '1';
              }
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
            ischecked2 = newBool;
              if(ischecked2 == true){
                materia2 = '2';
              }
            setState(() {

            });
          },
        ),
        const Text(
          'Sociales',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 5),
        Checkbox(
          value: ischecked3,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            ischecked3 = newBool;
              if(ischecked3 == true){
                materia3 = '3';
              }
            setState(() {
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
            ischecked4 = newBool;
              if(ischecked4 == true){
                materia4 = '4';
              }
            setState(() {
            });
          },
        ),
        const Text(
          'Muci',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 40),
        Checkbox(
          value: ischecked5,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            ischecked5 = newBool;
              if(ischecked5 == true){
                materia5 = '5';
              }
            setState(() {
            });
          },
        ),
        const Text(
          'Ingles',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 17),
        Checkbox(
          value: ischecked6,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            ischecked6 = newBool;
              if(ischecked6 == true){
                materia6 = '6';
              }
            setState(() {
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
            ischecked7 = newBool;
              if(ischecked7 == true){
                materia7 = '7';
              }
            setState(() {
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
            ischecked8 = newBool;
              if(ischecked8 == true){
                materia8 = '8';
              }
            setState(() {
            });
          },
        ),
        const Text(
          'OPLV',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(width: 15),
        Checkbox(
          value: ischecked9,
          activeColor: Colors.transparent,
          tristate: true,
          onChanged: (newBool) {
            ischecked9 = newBool;
              if(ischecked9 == true){
                materia9 = '9';
              }
            setState(() {
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
            ischecked10 = newBool;
              if(ischecked10 == true){
                materia10 = '10';
              }
            setState(() {
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

  // Widget checkbox5() {
  //   return Row(
  //     children: [
  //       Checkbox(
  //         value: ischecked11,
  //         activeColor: Colors.transparent,
  //         tristate: true,
  //         onChanged: (newBool) {
  //           setState(() {
  //             ischecked11 = newBool;
  //           });
  //         },
  //       ),
  //       const Text(
  //         'Evidencia actitudes favorables para la convivencia',
  //         style: TextStyle(fontSize: 13),
  //       ),
  //     ],
  //   );
  // }

  // Widget checkbox6() {
  //   return Row(
  //     children: [
  //       Checkbox(
  //         value: ischecked12,
  //         activeColor: Colors.transparent,
  //         tristate: true,
  //         onChanged: (newBool) {
  //           setState(() {
  //             ischecked12 = newBool;
  //           });
  //         },
  //       ),
  //       const Text(
  //         'Toma desiciones de forma autonoma y responsable',
  //         style: TextStyle(fontSize: 12),
  //       ),
  //     ],
  //   );
  // }

  // Widget checkbox7() {
  //   return Row(
  //     children: [
  //       Checkbox(
  //         value: ischecked13,
  //         activeColor: Colors.transparent,
  //         tristate: true,
  //         onChanged: (newBool) {
  //           setState(() {
  //             ischecked13 = newBool;
  //           });
  //         },
  //       ),
  //       const Text(
  //         'Se expresa y participa con respeto',
  //         style: TextStyle(fontSize: 12),
  //       ),
  //     ],
  //   );
  // }

  // Widget checkbox8() {
  //   return Row(
  //     children: [
  //       Checkbox(
  //         value: ischecked14,
  //         activeColor: Colors.transparent,
  //         tristate: true,
  //         onChanged: (newBool) {
  //           setState(() {
  //             ischecked14 = newBool;
  //           });
  //         },
  //       ),
  //       const Text(
  //         'Muestra sentido de pertencia y respeto por nuestra cultura',
  //         style: TextStyle(fontSize: 11),
  //       ),
  //     ],
  //   );
  // }

  Widget botonGuardar() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () async {
            // Lógica que se ejecutará cuando se presione el botón "Guardar"
            grado;
            seccion1;
            genero;
            m1 = materia1;
            m2 = materia2;
            m3 = materia3;
            m4 = materia4;
            m5 = materia5;
            m6 = materia6;
            m7 = materia7;
            m8 = materia8;
            m9 = materia9;
            m10 = materia10;
            estudianten = nombre1.text;
            estudiantea = apellido1.text;
            padren = nombre2.text;
            padrea = apellido2.text;
            dui = textField1Controller.text;
            nie = textField2Controller.text;
            _seleccionada = 'Año';
            _seleccionada2 = 'Seccion';
            _seleccionada3 = 'Genero';
            ischecked = false;
            ischecked2 = false;
            ischecked3 = false;
            ischecked4 = false;
            ischecked5 = false;
            ischecked6 = false;
            ischecked7 = false;
            ischecked8 = false;
            ischecked9 = false;
            ischecked10 = false;
            nombre1.text = '';
            apellido1.text = '';
            nombre2.text = '';
            apellido2.text = '';
            textField1Controller.text = '';
            textField2Controller.text = '';
            await registroAlumno(grado, seccion1, genero, estudianten, estudiantea, padren, padrea, dui,  nie,  m1,  m2,  m3,  m4,  m5,  m6,  m7,  m8,  m9,  m10);
            setState(() {
              informacionGuardada = 'Datos guardados';
            });
          },
          child: const Text('Guardar'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Cambia el color de fondo del botón a rojo
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {
            // Lógica que se ejecutará cuando se presione el botón "Cancelar"
            setState(() {
              _seleccionada = 'Año';
              _seleccionada2 = 'Seccion';
              _seleccionada3 = 'Genero';
              ischecked = false;
              ischecked2 = false;
              ischecked3 = false;
              ischecked4 = false;
              ischecked5 = false;
              ischecked6 = false;
              ischecked7 = false;
              ischecked8 = false;
              ischecked9 = false;
              ischecked10 = false;
              nombre1.text = '';
              apellido1.text = '';
              nombre2.text = '';
              apellido2.text = '';
              textField1Controller.text = '';
              textField2Controller.text = '';
              informacionCancelada = 'Informacion calcelada';
            });
          },
          child: const Text('Cancelar'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red, // Cambia el color de fondo del botón a rojo
          ),
        ),
      ],
    );
  }

  Widget botonAyuda() {
    return Row(children: [
      ElevatedButton(
        onPressed: () {
          // Lógica que se ejecutará cuando se presione el botón "Guardar"
          Navigator.push(context,MaterialPageRoute(builder: (context) => const Manual()), );
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