import 'package:flutter/material.dart';
import '../developer/consultad.dart';


void main() {
  runApp(const Padre());
}

class Padre extends StatelessWidget {
  const Padre({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Usuarios',
      home: MyHomePage(title: 'Lista de Padres'),
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
  late Future<List<Map<String, dynamic>>> getDataFuture; // Variable para almacenar el Future

  @override
  void initState() {
    super.initState();
    getDataFuture = getData(); // Asigna el Future a la variable getDataFuture
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
        future: getDataFuture, // Utiliza la variable getDataFuture que almacena el Future
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
                      'Nombre_padre',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'DUI',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                rows: data
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                item['nombre_padre'].toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          DataCell(
                            InkWell(
                              onTap: () {
                                (item['dui'].toString());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  item['dui'].toString(),
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
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
