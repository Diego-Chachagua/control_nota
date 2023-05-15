import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Hijos(),
  ));
}

class Hijos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagen1.jpeg'),
            fit: BoxFit.cover
          ),
        ),
        child:  Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: const Center(child:  Text('CONTROL DE NOTAS', style: TextStyle(fontSize: 30),)),
            ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Table(
              columnWidths: const {
                0: FractionColumnWidth(0.5)
              },
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    hijos(),
                    nie(),
                  ]
                ),

                TableRow(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255)
                  ),
                  children: [
                    hijo1(),
                    nie1(),
                  ]
                ),
              ],
            ),
            const SizedBox(
                height: 40,
              ),
            nieb(),
              const SizedBox(
                height: 40,
              ),
              
                  MaterialButton(
                  color: const Color.fromARGB(255, 107, 107, 107),
                  onPressed: (){},
                  child: const Text('Ver boleta', style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
          ],
        ),

        ),
    );
  }
}

Widget hijos(){
  return Container(
    color: Colors.blue,
    child:  const Center(child: Text('Hijos',style: TextStyle(fontSize: 20),))
    );
}

Widget nie(){
  return Container(
    color: Colors.blue,
    child: const Center(child:  Text('Nie',style: TextStyle(fontSize: 20),))
    );
}

Widget hijo1(){
  return const Center(child: Text('Chepito Tobar Menguez monroy',style: TextStyle(fontSize: 20),));
}

Widget nie1(){
  return const Center(child:  Text('01828733-1',style: TextStyle(fontSize: 20),));
}

Widget nieb(){
  return  Container(
    color: Colors.white,
    child: const TextField(
      decoration: InputDecoration(
        counterStyle: TextStyle(color: Colors.white),
        hintText: "Nie del alumno a ver boleta",
      ),
    ),
  );
}