// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_impor, avoid_print, unused_import

import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
import 'dart:collection';

import 'dart:io';

Future<dynamic> eliminarUsu(var usu ,String usu2) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/eliminarusuario.php'),
    body: <String, dynamic>{
      "usu": usu,
      "usu2": usu2,
    },
    );
}

Future<dynamic> registroAlumno(String grado, String seccion1, String genero, String estudianten, String estudiantea, String padren, 
String padrea, String dui, String nie, var m1, var m2, var m3, var m4, var m5, var m6, var m7, var m8, var m9, var m10) async{
  http.Response guardar = await http.post(
  Uri.parse('https://notasincas.000webhostapp.com/guardaralumn.php'),
  body: <String, dynamic>{
    "grado": grado,
    "secciones": seccion1,
    "genero": genero,
    "estudianten": estudianten,
    "estudiantea": estudiantea,
    "padren": padren,
    "padrea": padrea,
    "dui": dui,
    "nie": nie,
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
  print(grado);
  print(seccion1);
  print(genero);
  print(estudianten);
  print(estudiantea);
  print(padren);
  print(padrea);
  print(dui);
  print(nie);
  print(m1);
  print(m2);
  print(m3);
  print(m4);
  print(m5);
  print(m6);
  print(m7);
  print(m8);
  print(m9);
  print(m10);
}
