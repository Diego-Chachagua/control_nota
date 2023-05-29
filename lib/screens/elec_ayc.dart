// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class EleccionAyC extends StatelessWidget{
  const EleccionAyC({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_f.jpg'),
            fit: BoxFit.cover
          ),
        ),
      child:  Scaffold(
           backgroundColor: Colors.transparent,
           body: Center(
             child: Column(
               
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 const SizedBox(height: 90),
                 const Text('CONSULTA DE NOTAS',style: TextStyle(color: Colors.white,fontSize: 25),),
                 const SizedBox(height: 140),
                 Container(  
                  width: 300,
                  height: 400,
                  color: const Color.fromARGB(255, 116, 108, 108),
                  child: Column(
                    children:  [
                      //container de titulo 
                      Container(
                        decoration: const BoxDecoration(
                          
                          color: Colors.transparent,
                          border: Border(bottom: BorderSide(
                          color: Color.fromARGB(255, 212, 197, 197),
                          width: 3.0,
                        ))),    
                        width: 300,
                        child: Column(
                          children:const  [
                            SizedBox(height: 10,),
                             Center(child:  Text('Seleccione el grado y \nsección deseado\n',style:TextStyle(fontSize: 22),)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),         
                      Container(
                        
                        child: Center(
                          child: Row(
                            children: const [
                              
                            ],
                          ),
                        ),
                      )



                      

                  ]),
                 ),
               ],
             ),
           ),
      )
    );
  }

}