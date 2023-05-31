import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(const Padre());
}

class Padre extends StatelessWidget {
  const Padre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Usuarios',
      home:  MyHomePage(title: 'Lista de profesores'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Map<String, dynamic>>> getData() async {
    String url = 'https://notasincas.000webhostapp.com/consultapradre.php';

    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);

    List<Map<String, dynamic>> data = jsonResponse
        .map((item) => {
              'primer_nombre': item['primer_nombre'],
              'primer_apellido': item['primer_apellido'],
              'usuario_profe': item['usuario_profe'],
              'contrasena_profe': item['contrasena_profe'],
            })
        .toList();

    return data;
  }

  void copyToClipboard(String data) {
    Clipboard.setData(ClipboardData(text: data));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Datos copiados al portapapeles')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 30, 75, 52), // Color de fondo de la pantalla
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> data = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      'Nombre',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Apellido',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Usuario y\nContraseña',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                rows: data
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              item['primer_nombre'].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataCell(
                            Text(
                              item['primer_apellido'].toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          DataCell(
                            InkWell(
                              onTap: () {
                                String userData =
                                    '${item['usuario_profe']}\n${item['contrasena_profe']}';
                                copyToClipboard(userData);
                              },
                              child: Text(
                                '${item['usuario_profe']}\n${item['contrasena_profe']}',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
