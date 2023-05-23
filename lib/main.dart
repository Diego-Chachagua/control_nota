import 'package:control_notas/screens/form_a.dart';
import 'package:control_notas/screens/form_d.dart';
import 'package:control_notas/screens/form_p.dart';
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
            fit: BoxFit.cover
          ),
        ),
      child: Scaffold(
         appBar: AppBar(
            
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            title:  const Center(child:  Text('BIENVENIDOS',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 55),)),
          ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              inicio(),
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget inicio(){
  return Container(
    color: Colors.black,
    child: const Text('----¿Como desea iniciar sesion?----', style: TextStyle(fontSize: 25, color: Color.fromARGB(236, 255, 255, 255)),)
    );
}