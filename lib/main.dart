import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp());

}

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
child:  Column(
  
  children:  <Widget> [
     banner(),
     espacio(),
     espacio(),
     opciones(),
     
    
  ],
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