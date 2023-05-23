import 'package:flutter/material.dart';
import 'package:control_notas/screens/usuarios.dart';

class Periodos extends StatefulWidget {
  const Periodos({Key? key}) : super(key: key);

  @override
  State<Periodos> createState() => _PeriodosState();
}

class _PeriodosState extends State<Periodos> {
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
          const Text('ELIJA EL PERIODO AL QUE DESEA INGRESAR',style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),),
          const  SizedBox(height: 150,),
          MaterialButton(
            padding: const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: const RoundedRectangleBorder(),
            child: const Text(
              "Periodo 1",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
           MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape:const  RoundedRectangleBorder(),
            child: const Text(
              "Periodo 2",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
           MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: RoundedRectangleBorder(),
            child: const Text(
              "Periodo 3",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
           MaterialButton(
            padding:const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: RoundedRectangleBorder(),
            child: const Text(
              "Periodo 4",
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
          MaterialButton(
            padding:const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: RoundedRectangleBorder(),
            child: const Text(
              "Recuperacion",
              style: TextStyle(
                fontSize: 7.0,
              )
            )
          ),
          MaterialButton(
            padding:const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: RoundedRectangleBorder(),
            child: const Text(
              "Ver cuadro",
              style: TextStyle(
                fontSize: 9.0,
              )
            )
          ),
           MaterialButton(
            padding:const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
          
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Usuarios()));
            },
            shape: RoundedRectangleBorder(),
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
    )
    )
    ;
  }
}

