import 'package:flutter/material.dart';

void main() {
runApp( const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_o.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            title: const Text('Registro de Alumno'),
            backgroundColor: const Color(0x00E8E2E2),
          ),
          body: ListView(
        
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            children: <Widget>[_createInput()],
          ),
        ),
        ),
    );
  }
}

Widget _createInput(){
return TextField(
  textCapitalization: TextCapitalization.sentences,
  decoration: InputDecoration(
   
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    hintText: 'Escriba el nombre del estudiante',
    labelText: 'Nombre',
    helperText: 'Escriba el nombre solamente',
    suffixIcon: const Icon(Icons.account_circle)
  ),
);
}