import 'package:control_notas/screens/form_a.dart';
import 'package:control_notas/screens/form_d.dart';
import 'package:control_notas/screens/form_p.dart';
import 'package:control_notas/screens/manual.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: FirstRoute(),
    
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_o.jpg'),
            fit: BoxFit.fill
          ),
        ),
      child: Scaffold(
         appBar: AppBar(
            
            backgroundColor: Colors.transparent,
            elevation: 0,
            title:  const Center(child:  Text('BIENVENIDOS',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 55),)),
          ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              inicio(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    MaterialButton(
                      child: const SizedBox(height: 150, width: 150, child: Image(image: AssetImage('assets/padre.png'))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Formp()),
                        );
                      },
                    ),
                      
                    const SizedBox(
                      height: 50,
                    ),
                        
                    MaterialButton(
                      child: const SizedBox(height: 150, width: 150, child: Image(image: AssetImage('assets/profe.png'))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FormD()),
                        );
                      },
                    ),
                      
                    const SizedBox(
                      height: 50,
                    ),
                        
                    MaterialButton(
                      child: const SizedBox(height: 150, width: 150, child: Image(image: AssetImage('assets/admin.png'))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FormA()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
          onPressed: () {
            // Lógica que se ejecutará cuando se presione el botón "Guardar"
            Navigator.push(context,MaterialPageRoute(builder: (context) => const Manual()), );
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(
                    255, 64, 65, 66), // Cambia el color de fondo del botón a rojo
          ),
          child: const Text('Ayuda'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inicio(){
  return Container(
    color: Colors.transparent,
    child: const Text('----¿Como desea iniciar sesion?----', style: TextStyle(fontSize: 25, color: Color.fromARGB(236, 255, 255, 255)),)
    );
}


      
