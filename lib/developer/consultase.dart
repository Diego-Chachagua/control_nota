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

Future<dynamic> AgregarUsu(var usu, String usu2) async{
http.Response enviar = await http.post(
  Uri.parse('https://notasincas.000webhostapp.com/registro_profe.php'),
  body: <String, dynamic>{
    "usu": usu,
    "usu2": usu2,
    


  }
 );
}