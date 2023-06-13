// ignore_for_file: avoid_print, dead_code

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<dynamic>> fetchUserData(duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/llamarnotas.php?dui=$duibd'));
  if (response.statusCode == 200) {
    // Decodificar la respuesta JSON
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
    
  }
}

Future<List<dynamic>> lenguaje(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/lenguaje.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> mate(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/mate.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> ciencia(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/ciencia.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> sociales(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/sociales.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> muci(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/muci.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> ingles(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/ingles.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> infor(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/infor.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> oplv(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/oplv.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> seminario(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/seminario.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> hpp(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/hpp.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> avanLL(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/avanzoLL.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> avanCC(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/avanzoCC.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> avanES(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/avanzoES.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}

Future<List<dynamic>> avanMM(String duibd) async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/avanzoMM.php?dui=$duibd'));
  
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}