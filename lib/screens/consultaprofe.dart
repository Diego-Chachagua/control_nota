import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(const Datos(

  ));
}

class Datos extends StatelessWidget {
  const Datos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
    String url = 'https://notasincas.000webhostapp.com/consultaprofe.php';

    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);

    List<Map<String, dynamic>> data = jsonResponse
        .map((item) => {
              'cod_profe': item['cod_profe'],
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/fondo_13.jpg'),
            fit: BoxFit.fill
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(child: Text(widget.title)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent, // Color de fondo de la pantalla
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
                        'N',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Nombre y\nApellido ',
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
                                item['cod_profe'].toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            DataCell(
                              Text(
                                '${item['primer_nombre']}\n${item['primer_apellido']}',
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
      ),
    );
  }
}
