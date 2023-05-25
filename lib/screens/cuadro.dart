import 'package:flutter/material.dart';

class CuadroN1 extends StatelessWidget {
  CuadroN1({super.key});
  final notaEstu = TextEditingController();
  final a1 = TextEditingController();
  final a2 = TextEditingController();
  final po = TextEditingController();

  var nota, act1, act2, pruO;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fondo_o.jpg'), fit: BoxFit.cover),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      SizedBox(
                        height: 100,
                        width: 50,
                      ),
                      Text(
                        'GRADO: "1°"',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'SECCION: "H"',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 80,
                        width: 50,
                      ),
                      Text(
                        'MATERIA: Estudios Sociales',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'PERIODO: 1',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: const {
                      0: FractionColumnWidth(0.09),
                      1: FractionColumnWidth(0.17),
                      2: FractionColumnWidth(0.35),
                      3: FractionColumnWidth(0.08),
                      4: FractionColumnWidth(0.08),
                      5: FractionColumnWidth(0.08),
                      6: FractionColumnWidth(0.08),
                    },
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Caja(),
                        Caja1(),
                        Caja2(),
                        A1(),
                        A2(),
                        PO(),
                        PM(),
                      ]),
                    ],
                  ),
                  Tabledata(),
                  const SizedBox(
                    height: 290,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 390,
                        color: Color.fromARGB(176, 3, 52, 95),
                        foregroundDecoration:
                            BoxDecoration(border: Border.all(width: 3.0)),
                        child: Center(
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '  Ingreso de Notas',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'NIE:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Container(
                                    color: Colors.white,
                                    width: 90,
                                    height: 20,
                                    child: const Center(
                                        child: TextField(
                                      keyboardType: TextInputType.number,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Actividad 1:',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  color: Colors.white,
                                  width: 50,
                                  height: 20,
                                  child: const Center(
                                      child: TextField(
                                    keyboardType: TextInputType.number,
                                  )),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  'Actividad 2:',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  color: Colors.white,
                                  width: 50,
                                  height: 20,
                                  child: const Center(
                                      child: TextField(
                                    keyboardType: TextInputType.number,
                                  )),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  'Prueba:',
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  color: Colors.white,
                                  width: 50,
                                  height: 20,
                                  child: const Center(
                                      child: TextField(
                                    keyboardType: TextInputType.number,
                                  )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
      onPressed: () {},
      child: const Center(child: Text('Guardar')),
    ),
                                const SizedBox(
                                  width: 30,
                                ),
                                ElevatedButton(
      onPressed: () {},
      child: const Center(child: Text('Reiniciar')),
    ),
                              ],
                            ),
                          ]),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Center(child: Text('Regresar')),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class Caja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        color: Colors.white,
        child: const Center(
          child: Text('N°'),
        ));
  }
}

class Caja1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: Colors.white,
      child: const Center(
        child: Text('NIE'),
      ),
    );
  }
}

class Caja2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        color: Colors.white,
        child: const Center(
          child: Text('Nombre Estudiante'),
        ));
  }
}

class A1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        color: Colors.white,
        child: const Center(
          child: Text('A1'),
        ));
  }
}

class A2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        color: Colors.white,
        child: const Center(
          child: Text('A2'),
        ));
  }
}

class PO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        color: Colors.white,
        child: const Center(
          child: Text('PO'),
        ));
  }
}

class PM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 20,
        color: Colors.white,
        child: const Center(
          child: Text('PM'),
        ));
  }
}

class Tabledata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FractionColumnWidth(0.09),
          1: FractionColumnWidth(0.17),
          2: FractionColumnWidth(0.35),
          3: FractionColumnWidth(0.08),
          4: FractionColumnWidth(0.08),
          5: FractionColumnWidth(0.08),
          6: FractionColumnWidth(0.08),
        },
        border: TableBorder.all(),
        children: [
          TableRow(children: [
            Container(
                height: 20,
                color: Colors.white,
                child: const Center(
                  child: Text('1'),
                )),
            Container(
                height: 20,
                color: Colors.white,
                child: const Center(
                  child: Text('123456789'),
                )),
            Container(
                height: 20,
                color: Colors.white,
                child: const Center(
                  child: Text('Name And Last Name'),
                )),
            Container(
                height: 20,
                color: Colors.white,
                child: const Center(
                  child: Text('0'),
                )),
            Container(
                height: 20,
                color: Colors.white,
                child: const Center(
                  child: Text('0'),
                )),
            Container(
                height: 20,
                color: Colors.white,
                child: const Center(
                  child: Text('0'),
                )),
            Container(
                height: 20,
                color: Colors.white,
                child: const Center(
                  child: Text('0'),
                )),
          ])
        ]);
  }
}



