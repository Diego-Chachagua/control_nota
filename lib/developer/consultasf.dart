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
//busqueda de nie en la base de datos 
Future<dynamic> verNie(String nieEstu) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/nieestu.php'),
    body: <String, dynamic>{
      "niestu": nieEstu,  
    },
  );
    return enviar.body;
}
//ingreso de notas en periodo 1 en la base de datos
Future<dynamic> insertNP1(String? nieEstu,String? a1, String? a2 , String? po,var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/envionp1.php'),
    body: <String, dynamic>{
      "niestu": nieEstu, 
      "a1":a1, 
      "a2":a2,
      "po":po,
      "materia":materia,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
    
    
}
//insertar datos en archivo php del segundo periodo 2
Future<dynamic> insertNP2(String? nieEstu,String? a1, String? a2 , String? po,var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/enviop2.php'),
    body: <String, dynamic>{
      "niestu": nieEstu, 
      "a1":a1, 
      "a2":a2,
      "po":po,
      "materia":materia,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
    
    
}

Future<dynamic> insertNP3(String? nieEstu,String? a1, String? a2 , String? po,var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/enviop3.php'),
    body: <String, dynamic>{
      "niestu": nieEstu, 
      "a1":a1, 
      "a2":a2,
      "po":po,
      "materia":materia,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
    
    
}

Future<dynamic> insertNP4(String? nieEstu,String? a1, String? a2 , String? po,var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/enviop4.php'),
    body: <String, dynamic>{
      "niestu": nieEstu, 
      "a1":a1, 
      "a2":a2,
      "po":po,
      "materia":materia,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
    
    
}

Future<dynamic> insertRe2(String? nieEstu,String? a1, String? a2 , String? po,var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/recup2.php'),
    body: <String, dynamic>{
      "niestu": nieEstu, 
      "a1":a1, 
      "a2":a2,
      "po":po,
      "materia":materia,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
    
    
}

Future<dynamic> insertRe1(String? nieEstu,String? a1, String? po,var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/recup1.php'),
    body: <String, dynamic>{
      "niestu": nieEstu, 
      "a1":a1, 
      
      "po":po,
      "materia":materia,
    },
  );
  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
    
    
}

Future<dynamic> buscarCode(String usuariobd,String contrabd) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/codeprofe.php'),
    body: <String, dynamic>{
      "usuariobd":usuariobd ,  
      "contrabd":contrabd,
    },
  );
    var resultado = jsonDecode(enviar.body);
    return resultado;
}

Future<dynamic> mostrarP1(var anio,var seccion, var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/notasp1.php'),
    body: <String, dynamic>{
      "anio":anio ,  
      "seccion":seccion,
      "materia":materia,
    },
  );
    var resultado = jsonDecode(enviar.body);
    print(resultado);
    
    return resultado;
}
//mostrar notas del periodo 2
Future<dynamic> mostrarP2(var anio,var seccion, var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/notasp2.php'),
    body: <String, dynamic>{
      "anio":anio ,  
      "seccion":seccion,
      "materia":materia,
    },
  );
    var resultado = jsonDecode(enviar.body);
    
    return resultado;
}
Future<dynamic> mostrarP3(var anio,var seccion, var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/notasp3.php'),
    body: <String, dynamic>{
      "anio":anio ,  
      "seccion":seccion,
      "materia":materia,
    },
  );
    var resultado = jsonDecode(enviar.body);
    
    return resultado;
}

Future<dynamic> mostrarP4(var anio,var seccion, var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/notasp4.php'),
    body: <String, dynamic>{
      "anio":anio ,  
      "seccion":seccion,
      "materia":materia,
    },
  );
    var resultado = jsonDecode(enviar.body);
    
    return resultado;
}

Future<dynamic> mostrarRe2(var anio,var seccion, var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/notasrec2.php'),
    body: <String, dynamic>{
      "anio":anio ,  
      "seccion":seccion,
      "materia":materia,
    },
  );
    var resultado = jsonDecode(enviar.body);
    
    return resultado;
}

Future<dynamic> mostrarRe1(var anio,var seccion, var materia) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/notasrec1.php'),
    body: <String, dynamic>{
      "anio":anio ,  
      "seccion":seccion,
      "materia":materia,
    },
  );
    var resultado = jsonDecode(enviar.body);
    
    return resultado;
}