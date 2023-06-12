// ignore_for_file: avoid_print, dead_code

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<dynamic>> fetchUserData(duibd) async {
  print(duibd);
  final response = await http.get(Uri.parse('https://notasincas.000webhostapp.com/llamarnotas.php?dui=$duibd'));
  if (response.statusCode == 200) {
    // Decodificar la respuesta JSON
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Error al cargar los datos');
    
  }
}
