// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'form_d.dart';
import 'periodo.dart';

class EleccionAyC extends StatefulWidget {
  var materia1;
  EleccionAyC({super.key, required this.materia1});

  @override
  State<EleccionAyC> createState() => _EleccionAyCState();
}

class _EleccionAyCState extends State<EleccionAyC> {
  String anio="";
  String seccionS="";
  String a = '';
  String _seleccionada = 'Año';
  List anios = ['Año', '1', '2'];
  String _seleccionada2 = 'Seccion';
  List seccion = ['Seccion', 'A', 'F', 'E', 'H', 'G', 'D'];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo_f.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                const Text(
                  'CONSULTA DE NOTAS',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                const SizedBox(height: 140),
                Container(
                  width: 300,
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                         image: AssetImage('assets/fondo_f1.jpg'),
                         fit: BoxFit.cover,
                      ),
                      
                      ),
                  child: Column(children: [
                    //container de titulo
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          border: Border(
                              bottom: BorderSide(
                            color: Color.fromARGB(255, 212, 197, 197),
                            width: 3.0,
                          ))),
                      width: 300,
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            'Seleccione el grado y \nsección deseado\n',
                            style: TextStyle(fontSize: 22,color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 230,
                      height: 100,
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 212, 197, 197),
                                width: 2),
                            top: BorderSide(
                                color: Color.fromARGB(255, 212, 197, 197),
                                width: 2)),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            //espacio para dropdow
                             DropdownButton(
                            value: _seleccionada,
                            items: GetOptionsDropDownButton(),
                            onChanged: (value) {
                              setState(() {
                                _seleccionada = value.toString();
                              });
                            },
                          ),
                         
                          const SizedBox(
                            width: 50,
                          ),
                           DropdownButton(
                            value: _seleccionada2,
                            items: GetOptionsDropDownButton2(),
                      
                            onChanged: (value) {
                              setState(() {
                                _seleccionada2 = value.toString();
                                if (_seleccionada2 == 'A') {
                                  a = '1';
                                }
                                if (_seleccionada2 == 'F') {
                                  a = '2';
                                }
                                if (_seleccionada2 == 'E') {
                                  a = '3';
                                }
                                if (_seleccionada2 == 'H') {
                                  a = '4';
                                }
                                if (_seleccionada2 == 'G') {
                                  a = '5';
                                }
                                if (_seleccionada2 == 'D') {
                                  a = '6';
                                }
                              });
                            },
                          ),
                         
                        ]),
                      ),
                    ),
                    const SizedBox(height: 50,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    ElevatedButton(
                      //inicio de definicion de guardar datos en variables
                      onPressed: (){
                        print(widget.materia1);
                        anio=_seleccionada;
                        seccionS=a;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Periodos(anio,seccionS,widget.materia1),
                        ));

                    },
                    child: const Text('Aceptar'),
                     ),

                      ElevatedButton(
                      onPressed: (){
                        
                    },
                    child: const Text('Cancelar'),
                     )
                  ],
                )
                  ]),
                ),
               
              ],
            ),
          ),
        ));
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton() {
    List<DropdownMenuItem<String>> annios = [];
    anios.forEach((element) {
      annios.add(DropdownMenuItem(
        value: element,
        child: Text(element),
      ));
    });
    return annios;
  }

  List<DropdownMenuItem<String>> GetOptionsDropDownButton2() {
    List<DropdownMenuItem<String>> secciones = [];
    seccion.forEach((element) {
      
      secciones.add(DropdownMenuItem(
        child: Text(element),
        
        value: element,
      ));
    });
    return secciones;
  }
}
