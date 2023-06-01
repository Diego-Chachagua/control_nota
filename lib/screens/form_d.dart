// ignore: file_names
import 'package:control_notas/screens/materias.dart';
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'elec_ayc.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FormD(),
  ));
}

class FormD extends StatefulWidget {
  const FormD({super.key});

  @override
  State<FormD> createState() => _FormDState();
}

class _FormDState extends State<FormD> {
final usuariob =TextEditingController();
final contrab =TextEditingController();

String usuariobd = "";
String contrabd = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_f.jpg'),
            fit: BoxFit.cover
          ),
        ),
      child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              
              title: const Center(child:  Text('CONTROL DE NOTAS', style: TextStyle(fontSize: 30),)),
            ),
            backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Cuerpo(),
                Row(
                children: [
              
              const SizedBox(
                width: 76,
              ),
              
                  MaterialButton(
                  color: Colors.red,
                  onPressed: (){
            Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                  },
                  child: const Text('Cancelar'),
                  ),
              
              const SizedBox(
                width: 30,
              ),
              
                  MaterialButton(
                  color: const Color.fromARGB(255, 20, 250, 28),
                  onPressed: () async{
                    
                    usuariobd = usuariob.text;
                    contrabd = contrab.text;
                    if (usuariobd.isNotEmpty || contrabd.isNotEmpty) {
                    dynamic respuesta = await comprobard(usuariobd,contrabd);
                    if (respuesta == "error") {
                        _mensaje(context);

                      //se produjo un error
                    }
                    if (respuesta == "noExiste") {
                      //no hay usuario con ese nombre
                      _mensajeUsu(context);
                    } else {
                         if(respuesta == "profe"){
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Materia()),
                   );
                      }
                    }
                    }
                  },
                  child: const Text('Iniciar'),
                  ),
                ],
                ),
              ],
            ),
          ),
    
          ),
    );
  }


// ignore: non_constant_identifier_names
Widget  Cuerpo(){
 return  Center(
   child: SizedBox(
    height: 500,
    width: 300,
     child: Container(
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                topLeft: Radius.circular(0),
               topRight: Radius.circular(0),
              ),
              image: DecorationImage(
                image: AssetImage('assets/fondo_f1.jpg'),
                fit: BoxFit.fill
              ),
            ),
            child: Column(children:  <Widget> [
              espacio(),
              control(),
              linea(),
              espacio(),
              usuario(),
              contrasena(),
              

            ]),
     ),
   ),
 );
}

Widget control(){
  return const Text("Inicio de sesión", style: TextStyle(color: Colors.black, fontSize: 40),);
}

Widget espacio(){
  return const SizedBox(
    height: 30,
  );
}

Widget linea(){
  return const Text('___________________________________________________', style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),);
}

Widget usuario(){
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      controller: usuariob,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "Usuario",
      ),
    ),
  );
}

Widget contrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      controller: contrab,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "contraseña",
      ),
    ),
  );
} 


void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Usuario no existe"),
            content: const Text(
                'Los datos ingresados no coinciden con alguna cuenta de usuario'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    usuariob.clear();
                    contrab.clear();
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
            title: const Text("Error de conexión"),
            content:
                const Text('Ocurrió un error al conectar con la base de datos'
                    'o consulta errónea.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    usuariob.clear();
                    contrab.clear();
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

