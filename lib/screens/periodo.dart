import 'package:flutter/material.dart';

import 'cuadro.dart';

class Periodos extends StatefulWidget {
   String anios;
   String seccion;
   var materia1;
  Periodos( this.anios, this.seccion,this.materia1, {super.key});

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
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   CuadroN1(widget.anios,widget.seccion,widget.materia1)));
                print(widget.anios);
                print(widget.seccion);
              });
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
            color: const Color.fromARGB(255, 255, 255, 255),
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
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: const RoundedRectangleBorder(),
            child: const Text(
              "Periodo 3",
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
              "Periodo 4",
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
              "Recuperacion",
              style: TextStyle(
                fontSize: 7.0,
              )
            )
          ),
          MaterialButton(
            padding:const  EdgeInsets.symmetric(horizontal: 80, vertical: 10.0),
            color: const Color.fromARGB(255, 255, 255, 255),
            onPressed: () {
              setState(() {});
            },
            shape: const RoundedRectangleBorder(),
            child: const Text(
              "Ver cuadro",
              style: TextStyle(
                fontSize: 9.0,
              )
            )
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

