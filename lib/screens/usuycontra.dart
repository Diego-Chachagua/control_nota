import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../developer/consultaso.dart';
import '../main.dart';
import 'hijos.dart';
import 'manual.dart';

void main() {
  runApp(const MyApp());
  home: const Usuycontra(seccione2: '',gradoe2: '',);
}

class Usuycontra extends StatefulWidget{
  final String seccione2;
  final String gradoe2;
  const Usuycontra({super.key, required this.seccione2, required this.gradoe2});
  @override
  State<Usuycontra> createState() => _UsuycontraState();
}

class _UsuycontraState extends State<Usuycontra> {
List<String> nombrep = [];
List<String> usuario = [];
List<String> contra = [];
var reslt;

@override
void initState(){
  super.initState();
  (() async{
    reslt = await enviarp(widget.seccione2,widget.gradoe2);
    if (reslt!="noExisten"){
      for (var i = 0; i < reslt.length; i++){
    var dato =reslt[i];
    print(dato["nombre_padre"]);
    print(dato["usuario_padres"]);
    print(dato["contrasena_padres"]);

  // ignore: non_constant_identifier_names
          var nom_tem = dato["nombre_padre"];
     

          // ignore: non_constant_identifier_names
          var id_tem = dato["usuario_padres"];
         
         // ignore: non_constant_identifier_names
          var num_tem1 = dato["contrasena_padres"];

setState(() {
  // Actualizar las listas con los datos obtenidos
  nombrep.add(nom_tem);
  usuario.add(id_tem);
  contra.add(num_tem1);
});
  }
    }
  })();
}


  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/imagen1.jpeg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: const Center(
              child: Text(
            'CONTROL DE NOTAS',
            style: TextStyle(fontSize: 30),
          )),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Table(
              border: TableBorder.all(),
              children:  [
                TableRow(
                  children: [
                    usuariop(),
                    contrasenap(),
                    padre(),
                  ]
                ),

                  TableRow(
                    children: [
                      usuariosp(),
                      contrap(),
                      nombrepa(),
                    ]
                  ),
              ],
            )
          ],
        )
      ),
    );
  }

  Widget usuariop() {
    return Container(
        color: Colors.blue,
        child: const Center(
            child: Text('Usuarios',style: TextStyle(fontSize: 20),
        )));
  }

   Widget contrasenap() {
    return Container(
        color:  Colors.blue,
        child:  const Center(
            child: Text(
          'Contraseña',
          style: TextStyle(fontSize: 20),
        )));
  }

   Widget padre() {
    return Container(
        color: Colors.blue,
        child:  const Center(
            child: Text(
          'Padres',
          style: TextStyle(fontSize: 20),
        )));
  }

  Widget nombrepa() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        
        for (var i = 0; i < nombrep.length; i++)
          Text(nombrep[i], style: const TextStyle(fontSize: 15)),
      ],
    ),
  );
}

Widget usuariosp() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        for (var i = 0; i < usuario.length; i++)
          Text(usuario[i], style: const TextStyle(fontSize: 15)),
      ],
    ),
  );
}

Widget contrap() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        for (var i = 0; i < contra.length; i++)
          Text(contra[i], style: const TextStyle(fontSize: 15)),
      ],
    ),
  );
}

}