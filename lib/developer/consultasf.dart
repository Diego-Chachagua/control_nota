// ignore_for_file: non_constant_identifier_names

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

Future<dynamic> verNie(String nieEstu) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/nieestu.php'),
    body: <String, dynamic>{
      "niestu": nieEstu,  
    },
  );
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
}