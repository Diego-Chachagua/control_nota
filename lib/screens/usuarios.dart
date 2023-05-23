import 'package:flutter/material.dart';


class Usuarios extends StatefulWidget {
  const Usuarios({Key? key}) : super(key: key);

  @override
  State<Usuarios> createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  //Variable, Propiedad
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: avoid_unnecessary_containers
      home: Container(
        decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fondo_o.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child:  Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 90,),
                const Text('Ver usuarios', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),),
                
            Container(
              //Primer textfield
              padding: const EdgeInsets.symmetric( horizontal: 150, vertical: 15,),
              child: const TextField(
                //autofocus: true,
                keyboardType: TextInputType.text,
                autocorrect: true,
                //Decoration
                decoration: InputDecoration(
                  labelText: 'Grado',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                  color: Colors.white
                  
                  
                  
                    ),
                  ),
          
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                  color: Colors.white
                
                    ),
                  ),
                ),
              ),
            ),
            
            Container(
              //SEGUNDO TEXTFIELD
             padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15,),
             child: const TextField(
              keyboardType: TextInputType.text,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Seccion',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.white
                    
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.white
                ),
                ),
              ),
             ), 
               
            ),
            //PRIMER BOTON DE VER USUARIOS
             MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15, ),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: (){
              setState(() {
            
          });
              },
              shape: const RoundedRectangleBorder(),
              child: const Text(
                'Ver usuarios',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
          
            const SizedBox(height: 10,),
                const Text('Ver estudiantes', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),),
          //TERCER TEXFIELD 
          Container(
            padding: const EdgeInsets.symmetric( horizontal: 150, vertical: 15,),
              child: const TextField(
                keyboardType: TextInputType.text,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Grado',
                enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10)), 
                borderSide: BorderSide(
                  color: Colors.white
                )
                
                ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                color: Colors.white
                ),

              ),

              ),

              ),


          ),
          //CUARTO TEXTFIELD 
          Container(
             padding: const EdgeInsets.symmetric( horizontal: 150, vertical: 15,),
              child: const TextField(
                keyboardType: TextInputType.text,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Seccion',
                enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10)), 
                borderSide: BorderSide(
                  color: Colors.white
                ),
                ),
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                color: Colors.white
                ),
                ),
              ),
              ),


          ),
          //SEGUNDO BOTON PARA VER ESTUDIANTES
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 15, ),
            color: const Color.fromARGB(255, 255, 255, 255),
             onPressed: (){
            setState(() {
              
            });
            },
             shape: const RoundedRectangleBorder(),
              child: const Text(
                'Ver estudiantes',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
            const SizedBox(height: 6,),
                const Text('Ver padres', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
                ),
                //QUINTO TEXTFIELD
                Container(
                  padding: const EdgeInsets.symmetric( horizontal: 150, vertical: 15,),
              child: const TextField(
                keyboardType: TextInputType.text,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Grado',
                enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10)), 
                borderSide: BorderSide(
                  color: Colors.white
                ),
                ),
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                color: Colors.white
                ),
                ),
              ),
              ),

                ),
                //SEXTO TEXTFIELD
                Container(
               padding: const EdgeInsets.symmetric( horizontal: 150, vertical: 15,),
              child: const TextField(
                keyboardType: TextInputType.text,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'Seccion',
                enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10)), 
                borderSide: BorderSide(
                  color: Colors.white
                ),
                ),
                 focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                color: Colors.white
                ),
                 ),
              ),
              ),
                ),
                //TERCER BOTON PARA VER PADRES
                MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15, ),
            color: const Color.fromARGB(255, 255, 255, 255),
             onPressed: (){
             setState(() {
               
             });
             
             },
             shape: const RoundedRectangleBorder(),
            child: const Text(
              "Ver padres",
              style: TextStyle(
                fontSize: 9.0,
              )
            )
            ),
            const SizedBox(height: 40,),
                const Text('Ver profesor:', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
                ),
                //CUARTO BOTON PARA VER PROFESOR
                 MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15, ),
            color: const Color.fromARGB(255, 255, 255, 255),
             onPressed: (){
             setState(() {
               
             });
             
             },
             shape: const RoundedRectangleBorder(),
            child: const Text(
              "Ver profesores",
              style: TextStyle(
                fontSize: 9.0,
              ),
            ),
                 ),
                  const SizedBox(height: 40,),
                const Text('Ver boletas', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
                ),
                //SEPTIMO TEXTFIELD
              Container(
                padding: const  EdgeInsets.symmetric(horizontal: 150,vertical: 15,),
              child: const TextField(
                keyboardType: TextInputType.text,
              autocorrect: true,
              decoration: InputDecoration(
                labelText: 'NIE',
                enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10)), 
                borderSide: BorderSide(
                  color: Colors.white
                ),
                ),
                 focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                color: Colors.white
                ),
                 ),
              ),
              ),
              ),
              //QUINTO BOTON PARA VER BOLETAS
               MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15, ),
            color: const Color.fromARGB(255, 255, 255, 255),
             onPressed: (){
             setState(() {
            
            
             });
             
             },
             shape: const RoundedRectangleBorder(),
            child: const Text(
              "Ver boletas",
              style: TextStyle(
                fontSize: 9.0,
              ),
            ),
               ),
                const SizedBox(height: 40,),
                const Text('CENTRO DE AYUDA!', style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
                ),
                ),
                //BOTON DE AYUDA
                 MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15, ),
            color: const Color.fromARGB(255, 255, 255, 255),
             onPressed: (){
             setState(() {
               
             });
             
             },
             shape: const RoundedRectangleBorder(),
            child: const Text(
              "AYUDA",
              style: TextStyle(
                fontSize: 9.0,
              ),
            ),
                 ),
              ],
              ),
          ),
        ),
        
      ),
      
      
      
    );
  }
  
}
