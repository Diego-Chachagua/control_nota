import 'package:control_notas/developer/consultase.dart';
import 'package:flutter/material.dart';

import 'manual.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(debugShowCheckedModeBanner: false, home: Profesor());
  }
}

class Profesor extends StatefulWidget {
  const Profesor({super.key});

  @override
  State<Profesor> createState() => _ProfesorState();
}

class _ProfesorState extends State<Profesor> {
  String nombre1 = '';
  String secciones = '' ;
  String seccion1 = '';
  String apellido1 = '';
  String anio = '';
  String genero1 = '';
  String g = '';
  String primero = '';
  String segundo = '';
  String _seleccionada = 'Año';
  List anios = ['Año', '1', '2'];
    String _seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'F', 'E', 'H', 'G', 'D'];
  String _seleccionada3 = 'genero';
  List gene = ['genero', 'Masculino', 'Femenino'];
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
  String informacionGuardada = '';
  String informacionCancelada = '';
  TextEditingController _controller = TextEditingController();
  TextEditingController nombrep = TextEditingController();
  TextEditingController apellidop = TextEditingController();
  @override
  void dispose() {
    nombrep.dispose();
    apellidop.dispose();
    super.dispose();
  }
 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondo_12.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: const Text('Registro de Profesor'),
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
          // checkbox5(),
          // checkbox6(),
          // checkbox7(),
          // checkbox8(),
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
      controller: nombrep,
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
      controller: apellidop,
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
                  if(_seleccionada == '1 y 2'){
                    primero = '1';
                    segundo = '2';
                  }
                });
              },
                     ),
        const SizedBox(width: 20),
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
        const SizedBox(width: 20),
        
           DropdownButton(
            value: _seleccionada3,
            items: GetOptionsDropDownButton3(),
            onChanged: (value) {
              setState(() {
                _seleccionada3 = value.toString();
                if (_seleccionada3 == 'Masculino') {
                  genero1 = 'M';
                }else{
                  genero1 = 'F';
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
            setState(() {
              ischecked2 = newBool;
              if(ischecked2 == true){
                materia2 = '2';
              }
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
              if(ischecked3 == true){
                materia3 = '3';
              }
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
              if(ischecked == true){
                materia4 = '4';
              }
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
              if(ischecked5 == true){
                materia5 = '5';
              }
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
              if(ischecked6 == true){
                materia6 = '6';
              }
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
              if(ischecked7 == true){
                materia7 = '7';
              }
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
              if(ischecked8== true){
                materia8 = '8';
              }
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
              if(ischecked9 == true){
                materia9 = '9';
              }
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
              if(ischecked10 == true){
                materia10 = '10';
              }
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
            print(_seleccionada);
            print(nombre1);
            print(_seleccionada3);
            nombre1;
            apellido1;
            seccion1;
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
            nombre1 = nombrep.text;
            apellido1 = apellidop.text;
            genero1;
            anio = _seleccionada;
            primero;
            segundo;
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
            nombrep.text = "";
            apellidop.text = "";
            dynamic respuesta = await registroProfesor(nombre1, seccion1, apellido1, anio, genero1,  m1,  m2,  m3,  m4,  m5,  m6,  m7,  m8,  m9,  m10, primero, segundo);
             if (respuesta == "error") {
              _mensaje(context);
               //se produjo un error
                        }
             if (respuesta == "exito") {
              //no hay usuario con ese nombre
              _mensajeUsu(context);
                        }
            // Lógica que se ejecutará cuando se presione el botón "Guardar"
            setState(() {
              informacionGuardada = 'Datos guardados';
            });
              Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profesor()),
                      );
          },
          child: const Text('Guardar'),
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

    void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Exito"),
            content: const Text(
                'Los datos ingresados fueeron guardados'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                     genero1;
            anio = _seleccionada;
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
            nombrep.text = "";
            apellidop.text = "";
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content:
                const Text('Ocurrió un error al conectar con la base de datos'
                    'o consulta errónea.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                       genero1;
            anio = _seleccionada;
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
            nombrep.text = "";
            apellidop.text = "";
                    });
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }
}
