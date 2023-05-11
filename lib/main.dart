import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp( const MyApp());

}
//coment
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: avoid_unnecessary_containers
      home: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_o.jpg'),
            fit: BoxFit.cover
          ),
        ),
        
        child:    Scaffold(
          appBar: AppBar(
            
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            title:  Center(child:  ElasticIn(child: const Text('BIENVENIDOS',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 55),))),
          ),
          backgroundColor: Colors.transparent,
        body: Cuerpo(),

        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget  Cuerpo(){
  // ignore: avoid_unnecessary_containers
  return Container(
child:  Center(
  child:   Column(
    children:  <Widget> [
      
      inicio(),
      espacio(),
      opciones(),
    ],
  
  ),
),
);
}

Widget banner(){
  return const SizedBox(height: 90, child:  Image(image: AssetImage('assets/bienvenidos.png'),fit: BoxFit.fill, ));
}

Widget opciones(){
  return  Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,

    children: [
       SizedBox(
        height: 150,
        width: 150,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const SizedBox(width: 190, height: 190, child: Image( image: AssetImage('assets/padre.png'))),
          onPressed: () {
      
              },
          ),
      ),

const SizedBox(
height: 50,
),

SizedBox(
        height: 150,
        width: 150,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const SizedBox(width: 190, height: 190, child: Image( image: AssetImage('assets/profe.png'))),
          onPressed: () {
      
              },
          ),
      ),

const SizedBox(
height: 50,
),

      SizedBox(
        height: 150,
        width: 150,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const SizedBox(width: 190, height: 190, child: Image( image: AssetImage('assets/admin.png'))),
          onPressed: () {
      
              },
          ),
      ),

    ],
  );
}

Widget espacio(){
  return const SizedBox(
    height: 50,
  );
}


Widget inicio(){
  return Container(
    color: Colors.black,
    child: const Text('----¿Como desea iniciar sesion?----', style: TextStyle(fontSize: 25, color: Color.fromARGB(236, 255, 255, 255)),)
    );
}
