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

Future<dynamic> registroAlumno(String grado, String secciones, String genero, String estudianten, String estudiantea, String padren, 
String padrea, String dui, String nie, var m1, var m2, var m3, var m4, var m5, var m6, var m7, var m8, var m9, var m10) async{
  http.Response guardar = await http.post(
  Uri.parse('https://notasincas.000webhostapp.com/guardaralumn.php'),
  body: <String, dynamic>{
    "grado": grado,
    "secciones": secciones,
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
 if (guardar.statusCode == 201) {
    return "error";
  } else {
    return guardar.body;
  }
}

Future<dynamic> consultap(var gradoprofe ,String seccionprofe) async{
  http.Response enviar1 = await http.post(
    Uri.parse("https://notasincas.000webhostapp.com/consultap.php"),
    body: <String, String>{
      "gradoprofe": gradoprofe,
      "r": seccionprofe,
    },
    );
}
Future<dynamic> getData(String seccionp, String gradop) async{
  http.Response enviar = await http.post(
    Uri.parse('https://notasincas.000webhostapp.com/consultap.php'),
    body: <String, dynamic>{
      "gradoprofe": gradop,
      "seccionprofe": seccionp,
    },
  );
  var resultado = jsonDecode(enviar.body);
   if (enviar.statusCode == 201) {
    return "error";
  } else {

    return resultado;
  }
}

Future<List<dynamic>> Ll(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/LL.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> CC(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/CC.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> ES(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/ES.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> MM(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/MM.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> MC(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/MC.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> IN(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/IN.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> INF(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/INF.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> OV(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/OV.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> SEMINARIO(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/SEMI.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> HPP(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/HPP.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}
Future<List<dynamic>> ALL(var bastar) async {
print('hola' + bastar);
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/ALL.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> ACC(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/ACC.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}
Future<List<dynamic>> AES(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/AES.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}
Future<List<dynamic>> AMM(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/AMM.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> fetchUserData(var bastar) async {
  final LL = await http.get(Uri.parse('https://notasincas.000webhostapp.com/stundedata.php?nie=$bastar'));
  if (LL.statusCode == 200) {
    final jsonData = json.decode(LL.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> cuadro1(var anios, var seccion, var materia1) async {
  http.Response response = await http.post(
  Uri.parse('https://notasincas.000webhostapp.com/cuadro1.php'),
  body: <String, dynamic>{
    'anio' : anios,
    'seccion' :  seccion,
    'materia' : materia1
  },
  );
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}