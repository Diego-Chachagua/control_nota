import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'dart:io';

Future<dynamic> registroProfesor(String nombre1, String apellido1, String anio, String genero1, var m1, var m2, var m3, var m4, var m5, var m6, var m7, var m8, var m9, var m10) async{
  http.Response Guardar = await http.post(
  Uri.parse('https://notasincas.000webhostapp.com/registro_profe.php'),
  body: <String, dynamic>{
    "nombre1": nombre1,
    "apellido1": apellido1,
    "genero1": genero1,
    "m1": m1,
    "m2": m2,
    "m3": m3,
    "m4": m4,
    "m5": m5,
    "m6": m6,
    "m7": m7,
    "m8": m8,
    "m9": m9,
    "m10": m10,
    
  }
  );
  return Guardar.body;
  
}

