import 'package:http/http.dart' as http;

import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'dart:io';

Future<List<dynamic>> fetchUserData() async {
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/llamarduidatosestu.php'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData as List<dynamic>;
  } else {
    throw Exception('Error al cargar los datos');
  }
}