

import 'package:http/http.dart' as http;

import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'dart:io';

Future<dynamic> comprobarp(String usuariobd, String duibd, String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/formp.php'),
    body: <String, dynamic>{
      "usuario": usuariobd,
      "dui": duibd,
      "contra": contrabd,
    },
  );
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
}

Future<dynamic> comprobard(String usuariobd, String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/formd.php'),
    body: <String, dynamic>{
      "usuario": usuariobd,
      "contra": contrabd,
    },
  );
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
}


Future<dynamic> comprobara(String usuariobd, String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/forma.php'),
    body: <String, dynamic>{
      "usuario": usuariobd,
      "contra": contrabd,
    },
  );
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
}

Future<dynamic> hijos(String duibd1) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/formp.php'),
    body: <String, dynamic>{
      "dui": duibd1,
    },
  );
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
}

Future<dynamic> enviardui(duibd1) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/hijos1.php'),
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

Future<dynamic> enviare(String seccione1,String gradoe1) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/estudiantesa.php'),
    body: <String, dynamic>{
      "seccion": seccione1,
      "grado": gradoe1,
    },
  );
  var resultado = jsonDecode(enviar.body);
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return resultado;
  }
}