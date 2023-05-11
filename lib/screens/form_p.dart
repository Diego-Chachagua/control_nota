import 'package:flutter/material.dart';

void main() {
  runApp(  const formp());
}
 
// ignore: camel_case_types
class formp extends StatelessWidget{
  const formp({super.key});

  
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_f.jpg'),
            fit: BoxFit.cover
          ),
        ),
        
        child:    Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            
            title: const Center(child:  Text('CONTROL DE NOTAS', style: TextStyle(fontSize: 30),)),
          ),
          backgroundColor: Colors.transparent,
        body: Cuerpo(),

        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget  Cuerpo(){
 return  Center(
   child: SizedBox(
    height: 500,
    width: 300,
     child: Container(
            decoration:  const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                topLeft: Radius.circular(0),
               topRight: Radius.circular(0),
              ),
              image: DecorationImage(
                image: AssetImage('assets/fondo_f1.jpg'),
                fit: BoxFit.fill
              ),
            ),
            child: Column(children:  <Widget> [
              espacio(),
              control(),
              linea(),
              espacio(),
              dui(),
              usuario(),
              contrasena(),
              botones(),

            ]),
     ),
   ),
 );
}

Widget control(){
  return const Text("Inicio de sesión", style: TextStyle(color: Colors.black, fontSize: 40),);
}

Widget espacio(){
  return const SizedBox(
    height: 30,
  );
}

Widget linea(){
  return const Text('___________________________________________________', style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),);
}

Widget usuario(){
  return  Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "Usuario",
      ),
    ),
  );
}

Widget contrasena(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "contraseña",
      ),
    ),
  );
} 

Widget dui(){
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counterStyle: const TextStyle(color: Colors.white),
        hintText: "dui",
      ),
    ),
  );
} 

Widget botones(){
  return Row(
    children: [

const SizedBox(
  width: 45,
),

      MaterialButton(
      color: Colors.red,
      onPressed: (){},
      child: const Text('Cancelar'),
      ),

const SizedBox(
  width: 30,
),

      MaterialButton(
      color: const Color.fromARGB(255, 20, 250, 28),
      onPressed: (){},
      child: const Text('Iniciar'),
      ),
    ],
  );
}
