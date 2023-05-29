import 'package:control_notas/screens/periodo.dart';
import 'package:flutter/material.dart';

import 'RegistroAlum.dart';
import 'eliminar.dart';


class Eleccion extends StatelessWidget{
  const Eleccion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen()
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  //Variable, Propiedad
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: avoid_unnecessary_containers
      home: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_o.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child:  Scaffold(
          backgroundColor: Colors.transparent,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
        children: [
         const  SizedBox(height: 130,),
          const Text('PRESIONA UNA OPCIÓN',style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),),
          const  SizedBox(height: 150,),
          MaterialButton(
            padding: const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Registro()));
              setState(() {});
            },
            shape: const RoundedRectangleBorder(),
            child: const Text(
              "Alumnos",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
           MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape:const  RoundedRectangleBorder(),
            child: const Text(
              "Profesor",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
           MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const EliminarDatos()));
            },
            shape: const RoundedRectangleBorder(),
            child: const Text(
              "Eliminar",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
           MaterialButton(
            padding:const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: const RoundedRectangleBorder(),
            child: const Text(
              "Consulta",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          MaterialButton(
            padding:const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) => const Periodos()));
            },
            shape: const RoundedRectangleBorder(),
            child: const Text(
              "Siguiente",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
      ],
          )
      )
        
     ),
    ));
  }
}

  