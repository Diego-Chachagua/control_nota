// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'hijos.dart';
import 'manual.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: Formp(),
  ));
}

class Formp extends StatefulWidget {
  const Formp({super.key});

  @override
  State<Formp> createState() => _FormpState();
}

class _FormpState extends State<Formp> {
final duib =TextEditingController();
final usuariob =TextEditingController();
final contrab =TextEditingController();

String duibd = "";
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
                  onPressed: () async {

                    duibd = duib.text;
                    usuariobd = usuariob.text;
                    contrabd = contrab.text;
                    if (duibd.isNotEmpty || usuariobd.isNotEmpty || contrabd.isNotEmpty) {
                    dynamic respuesta = await comprobarp(usuariobd, duibd,contrabd);
                    if (respuesta == "error") {
                        _mensaje(context);

                      //se produjo un error
                    }
                    if (respuesta == "noExiste") {
                      //no hay usuario con ese nombre
                      _mensajeUsu(context);
                    } else {

                      if(respuesta == "hijo"){
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Manual()),
                   );
                      } else if(respuesta == "hijos"){
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>   Hijos(duibd1: duibd)),
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
              dui(),
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

Widget dui(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      controller: duib,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "dui",
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
                    duib.clear();
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
                    duib.clear();
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

