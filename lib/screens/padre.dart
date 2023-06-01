import 'package:flutter/material.dart';

import '../developer/consultad.dart';

void main() {
  runApp(const Padre(seccionp: '', gradop: '',));
}

class Padre extends StatelessWidget {
  const Padre({Key? key, required String seccionp, required String gradop}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Text('Listado Padres', style: TextStyle(color: Color.fromARGB(255, 245, 245, 245),),
      ),
      ),
    );

  }
}
