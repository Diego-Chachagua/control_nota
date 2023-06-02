// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_impor, avoid_print, unused_import

import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
import 'dart:collection';

import 'dart:io';

Future<dynamic> llamardui(duibd1) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/boleta1.php'),
    body: <String, dynamic>{
      "dui": duibd1,
    },
  );
  var resultado = jsonDecode(enviar.body);
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return resultado;
  }
}