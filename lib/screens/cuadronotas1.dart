// ignore_for_file: avoid_print, unused_local_variable

import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../developer/consultad.dart';
import 'guardarbol.dart';

void generatepdf1(var anios, var materia1, var seccion ) async {
    String materias = '';
    String a = '';
    var notas = await cuadro1(anios, materia1, seccion);
    List<dynamic> nombre = [];
    List<dynamic> nie = [];

    //periodo #1
    List<dynamic> p1p1 = [];
    List<dynamic> p2p1 = [];
    List<dynamic> op1 = [];
    List<dynamic> pp1 = [];

    //periodo #2
    List<dynamic> p1p2 = [];
    List<dynamic> p2p2 = [];
    List<dynamic> op2 = [];
    List<dynamic> pp2 = [];

    //periodo #3
    List<dynamic> p1p3 = [];
    List<dynamic> p2p3 = [];
    List<dynamic> op3 = [];
    List<dynamic> pp3 = [];

    //periodo #4 
    List<dynamic> p1p4 = [];
    List<dynamic> p2p4 = [];
    List<dynamic> op4 = [];
    List<dynamic> pp4 = [];

    //recuperaciones y promedio total y final
    List<dynamic> r1 = [];
    List<dynamic> r2 = [];
    List<dynamic> ppr = [];
    List<dynamic> ppf = [];
    List<dynamic> ppt = [];
    List<dynamic> rl = [];

    for (var i = 0; i < notas.length; i++) {
      var dato = notas[i];
      var nie_tem = dato['nie'];
      var nom_tem = dato['nombre_estudiante'];
      //Periodo #1
      var p1_p1 = dato['act1_p1'];
      var p2_p1 = dato['act2_p1'];
      var o_p1 = dato['po_p1'];
      var p_p1 = dato['promedio_p1'];
      //Periodo #2
      var p1_p2 = dato['act1_p2'];
      var p2_p2 = dato['act2_p2'];
      var o_p2 = dato['po_p2'];
      var p_p2 = dato['promedio_p2'];
      //Periodo #3
      var p1_p3 = dato['act1_p3'];
      var p2_p3 = dato['act2_p3'];
      var o_p3 = dato['po_p3'];
      var p_p3 = dato['promedio_p3'];
      //Periodo #4
      var p1_p4 = dato['act1_p4'];
      var p2_p4 = dato['act2_p4'];
      var o_p4 = dato['po_p4'];
      var p_p4 = dato['promedio_p4'];

      //recuperaciones y promedio final y total
      var re1 = dato['re1'];
      var re2 = dato['re2'];
      var rp = dato['promedio_r'];
      var rpf = dato['promedio_f'];
      var rpt = dato['promedio_t'];
      var r = dato['estado'];

      nie.add(nie_tem);
      nombre.add(nom_tem);
      
      //Periodo #1
      p1p1.add(p1_p1);
      p2p1.add(p2_p1);
      op1.add(o_p1);
      pp1.add(p_p1);

      //Periodo #2
      p1p2.add(p1_p2);
      p2p2.add(p2_p2);
      op2.add(o_p2);
      pp2.add(p_p2);

      //Periodo #3
      p1p3.add(p1_p3);
      p2p3.add(p2_p3);
      op3.add(o_p3);
      pp3.add(p_p3);

      //Periodo #4
      p1p4.add(p1_p4);
      p2p4.add(p2_p4);
      op4.add(o_p4);
      pp4.add(p_p4);

      //recuperaciones y promedio final y total
      r1.add(re1);
      r2.add(re2);
      ppr.add(rp);
      ppf.add(rpf);
      ppt.add(rpt);
      rl.add(r);
    
    }
  
  if(materia1 == 1 ){
    materias = 'Lenguaje';
  }
  if(materia1 == 2 ){
    materias = 'Matemática';
  }
  if(materia1 == 3 ){
    materias = 'Ciencias';
  }

  if (seccion == 1) {
  a = 'A';
  }
  if (seccion == 2) {
    a = 'F';
  }
  if (seccion == 3) {
    a = 'E';
  }
  if (seccion == 4) {
    a = 'H';
  }
  if (seccion == 5) {
    a = 'G';
  }
  if (seccion == 6) {
    a = 'D';
  }

    final pdfDocument = PdfDocument();
    final page = pdfDocument.pages.add();
    final Size pageSize = page.getClientSize();
    final double pageWidth = pageSize.width;
    final double pageHeight = pageSize.height;
    final PdfGraphics graphics = page.graphics;
    graphics.translateTransform(
        pageWidth, 0); // Mover la página hacia la derecha
    graphics.rotateTransform(
        90); // Rotar la página en sentido horario (orientación horizontal)

    final PdfTextElement textElement1 = PdfTextElement(
      text: 'Grado: ' + anios.toString(),
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );

    final PdfTextElement textElement2 = PdfTextElement(
      text: 'Sección: $a',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12), 
    );


    final PdfTextElement textElement3 = PdfTextElement(
      text: 'Materia: ' + materias.toString(),
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );
    page.graphics.drawString(
      textElement1.text,
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(-100, 15, page.getClientSize().width, 40),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );

    page.graphics.drawString(
      textElement2.text,
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(100, 15, page.getClientSize().width, 40),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );

    page.graphics.drawString(
      textElement3.text,
      PdfStandardFont(PdfFontFamily.helvetica, 18),
      bounds: Rect.fromLTWH(300, 15, page.getClientSize().width, 40),
      format: PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
      ),
    );

    final PdfGrid grid = PdfGrid();
    grid.columns.add(count: 32);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'N°';
    header.cells[1].value = 'NIE';
    header.cells[2].value = '';
    header.cells[3].value = 'Nombre del estudiante';
    header.cells[4].value = '';
    header.cells[5].value = '';
    header.cells[6].value = '';
    header.cells[7].value = '';
    header.cells[8].value = '';
    header.cells[9].value = 'Periodo 1';
    header.cells[10].value = '';
    header.cells[11].value = '';
    header.cells[12].value = '';
    header.cells[13].value = 'Periodo 2';
    header.cells[14].value = '';
    header.cells[15].value = '';
    header.cells[16].value = '';
    header.cells[17].value = 'Periodo 3';
    header.cells[18].value = '';
    header.cells[19].value = '';
    header.cells[20].value = '';
    header.cells[21].value = 'Periodo 4';
    header.cells[22].value = '';
    header.cells[23].value = '';
    header.cells[24].value = '';
    header.cells[25].value = 'PP';
    header.cells[26].value = 'R1';
    header.cells[27].value = 'R2';
    header.cells[28].value = 'PF';
    header.cells[29].value = 'RESULTADO';
    header.cells[30].value = '';
    header.cells[31].value = '';

// Cambiar el ancho de la primera columna
    grid.columns[0].width = 13; // Establecer el ancho deseado de la columna

    // Crear una instancia de PdfGridCellStyle para personalizar el estilo de las celdas combinadas
    final PdfGridCellStyle cellStyle1 = PdfGridCellStyle();
    header.height = 30;

    // Crear la sub-grid
    final PdfGrid subGrid = PdfGrid();
    subGrid.columns.add(count: 4);
    subGrid.headers.add(1);
    subGrid.headers[0].cells[0].value = ' A1';
    subGrid.headers[0].cells[1].value = ' A2';
    subGrid.headers[0].cells[2].value = ' PO';
    subGrid.headers[0].cells[3].value = ' PM';

    subGrid.draw(page: page, bounds: const Rect.fromLTWH(205, 65, 274, 510));
    subGrid.draw(page: page, bounds: const Rect.fromLTWH(275, 65, 345, 510));
    subGrid.draw(page: page, bounds: const Rect.fromLTWH(346, 65, 275, 510));
    subGrid.draw(page: page, bounds: const Rect.fromLTWH(416, 65, 271, 510));

    final PdfGridCellStyle cellStyle = PdfGridCellStyle();
    cellStyle.stringFormat?.alignment = PdfTextAlignment.center;

    // Establecer la alineación del texto para cada celda individualmente
    final PdfGridCellStyle topCellStyle = PdfGridCellStyle();
    topCellStyle.stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.top,
    );
    final PdfGridCellStyle middleCellStyle = PdfGridCellStyle();
    middleCellStyle.stringFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );

    // Aplicar los estilos a las celdas específicas
    header.cells[9].style = topCellStyle; // Centrar en la parte superior
    header.cells[13].style = topCellStyle;
    header.cells[17].style = topCellStyle;
    header.cells[21].style = topCellStyle;
    header.cells[0].style = middleCellStyle; // Centrar en el medio
    header.cells[1].style = middleCellStyle;
    header.cells[3].style = middleCellStyle;
    header.cells[25].style = middleCellStyle;
    header.cells[26].style = middleCellStyle;
    header.cells[27].style = middleCellStyle;
    header.cells[28].style = middleCellStyle;
    header.cells[29].style = middleCellStyle;
    // ...


  for (int i = 2; i <= 29; i++) {
  if (nie.length <= i || nie[i] == null) {
      nie.add(' ');
      nombre.add(' ');
      p1p1.add(' ');
      p2p1.add(' ');
      op1.add(' ');
      pp1.add(' ');

      //Periodo #2
      p1p2.add(' ');
      p2p2.add(' ');
      op2.add(' ');
      pp2.add(' ');

      //Periodo #3
      p1p3.add(' ');
      p2p3.add(' ');
      op3.add(' ');
      pp3.add(' ');

      //Periodo #4
      p1p4.add(' ');
      p2p4.add(' ');
      op4.add(' ');
      pp4.add(' ');

      //recuperaciones y promedio final y total
      r1.add(' ');
      r2.add(' ');
      ppr.add(' ');
      ppf.add(' ');
      ppt.add(' ');
      rl.add(' ');
    }
  }

    PdfGridRow row1 = grid.rows.add();
    grid.rows[0].cells[0].value = '1';
    grid.rows[0].cells[1].value = nie[0];
    grid.rows[0].cells[2].value = '';
    grid.rows[0].cells[3].value = nombre[0];
    grid.rows[0].cells[4].value = '';
    grid.rows[0].cells[5].value = '';
    grid.rows[0].cells[6].value = '';
    grid.rows[0].cells[7].value = '';
    grid.rows[0].cells[8].value = '';
    grid.rows[0].cells[9].value = p1p1[0];;
    grid.rows[0].cells[10].value = p2p1[0];
    grid.rows[0].cells[11].value = op1[0];
    grid.rows[0].cells[12].value = pp1[0];
    grid.rows[0].cells[13].value = p1p2[0];
    grid.rows[0].cells[14].value = p2p2[0];
    grid.rows[0].cells[15].value = op2[0];
    grid.rows[0].cells[16].value = pp2[0];
    grid.rows[0].cells[17].value = p1p3[0];
    grid.rows[0].cells[18].value = p2p3[0];
    grid.rows[0].cells[19].value = op3[0];
    grid.rows[0].cells[20].value = pp3[0];
    grid.rows[0].cells[21].value = p1p4[0];
    grid.rows[0].cells[22].value = p2p4[0];
    grid.rows[0].cells[23].value = op4[0];
    grid.rows[0].cells[24].value = pp4[0];
    grid.rows[0].cells[25].value = ppf[0];
    grid.rows[0].cells[26].value = r1[0];
    grid.rows[0].cells[27].value = r2[0];
    grid.rows[0].cells[28].value = ppt[0];
    grid.rows[0].cells[29].value = rl[0];
    grid.rows[0].cells[30].value = '';
    grid.rows[0].cells[31].value = '';
  
    row1 = grid.rows.add();
    grid.rows[1].cells[0].value = '2';
    grid.rows[1].cells[1].value = nie[1];
    grid.rows[1].cells[2].value = '';
    grid.rows[1].cells[3].value = nombre[1];
    grid.rows[1].cells[4].value = '';
    grid.rows[1].cells[5].value = '';
    grid.rows[1].cells[6].value = '';
    grid.rows[1].cells[7].value = '';
    grid.rows[1].cells[8].value = '';
    grid.rows[1].cells[9].value = p1p1[1];;
    grid.rows[1].cells[10].value = p2p1[1];
    grid.rows[1].cells[11].value = op1[1];
    grid.rows[1].cells[12].value = pp1[1];
    grid.rows[1].cells[13].value = p1p2[1];
    grid.rows[1].cells[14].value = p2p2[1];
    grid.rows[1].cells[15].value = op2[1];
    grid.rows[1].cells[16].value = pp2[1];
    grid.rows[1].cells[17].value = p1p3[1];
    grid.rows[1].cells[18].value = p2p3[1];
    grid.rows[1].cells[19].value = op3[1];
    grid.rows[1].cells[20].value = pp3[1];
    grid.rows[1].cells[21].value = p1p4[1];
    grid.rows[1].cells[22].value = p2p4[1];
    grid.rows[1].cells[23].value = op4[1];
    grid.rows[1].cells[24].value = pp4[1];
    grid.rows[1].cells[25].value = ppf[1];
    grid.rows[1].cells[26].value = r1[1];
    grid.rows[1].cells[27].value = r2[1];
    grid.rows[1].cells[28].value = ppt[1];
    grid.rows[1].cells[29].value = rl[1];
    grid.rows[1].cells[30].value = '';
    grid.rows[1].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[2].cells[0].value = '3';
    grid.rows[2].cells[1].value = nie[2];
    grid.rows[2].cells[2].value = nombre[2];
    grid.rows[2].cells[3].value = '';
    grid.rows[2].cells[4].value = '';
    grid.rows[2].cells[5].value = '';
    grid.rows[2].cells[6].value = '';
    grid.rows[2].cells[7].value = '';
    grid.rows[2].cells[8].value = '';
    grid.rows[2].cells[9].value = p1p1[2];
    grid.rows[2].cells[10].value = p1p2[2];
    grid.rows[2].cells[11].value = op1[2];
    grid.rows[2].cells[12].value = pp1[2];
    grid.rows[2].cells[13].value = p1p2[2];
    grid.rows[2].cells[14].value = p2p2[2];
    grid.rows[2].cells[15].value = op2[2];
    grid.rows[2].cells[16].value = pp2[2];
    grid.rows[2].cells[17].value = p1p3[2];
    grid.rows[2].cells[18].value = p2p3[2];
    grid.rows[2].cells[19].value = op3[2];
    grid.rows[2].cells[20].value = pp3[2];
    grid.rows[2].cells[21].value = p1p4[2];
    grid.rows[2].cells[22].value = p2p4[2];
    grid.rows[2].cells[23].value = op4[2];
    grid.rows[2].cells[24].value = pp4[2];
    grid.rows[2].cells[25].value = ppf[2];
    grid.rows[2].cells[26].value = r1[2];
    grid.rows[2].cells[27].value = r2[2];
    grid.rows[2].cells[28].value = ppt[2];
    grid.rows[2].cells[29].value = rl[2];
    grid.rows[2].cells[30].value = '';
    grid.rows[2].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[3].cells[0].value = '4';
    grid.rows[3].cells[1].value = nie[3];
    grid.rows[3].cells[2].value = nombre[3];
    grid.rows[3].cells[3].value = '';
    grid.rows[3].cells[4].value = '';
    grid.rows[3].cells[5].value = '';
    grid.rows[3].cells[6].value = '';
    grid.rows[3].cells[7].value = '';
    grid.rows[3].cells[8].value = '';
    grid.rows[3].cells[9].value = p1p1[3];
    grid.rows[3].cells[10].value = p1p2[3];
    grid.rows[3].cells[11].value = op1[3];
    grid.rows[3].cells[12].value = pp1[3];
    grid.rows[3].cells[13].value = p1p2[3];
    grid.rows[3].cells[14].value = p2p2[3];
    grid.rows[3].cells[15].value = op2[3];
    grid.rows[3].cells[16].value = pp2[3];
    grid.rows[3].cells[17].value = p1p3[3];
    grid.rows[3].cells[18].value = p2p3[3];
    grid.rows[3].cells[19].value = op3[3];
    grid.rows[3].cells[20].value = pp3[3];
    grid.rows[3].cells[21].value = p1p4[3];
    grid.rows[3].cells[22].value = p2p4[3];
    grid.rows[3].cells[23].value = op4[3];
    grid.rows[3].cells[24].value = pp4[3];
    grid.rows[3].cells[25].value = ppf[3];
    grid.rows[3].cells[26].value = r1[3];
    grid.rows[3].cells[27].value = r2[3];
    grid.rows[3].cells[28].value = ppt[3];
    grid.rows[3].cells[29].value = rl[3];
    grid.rows[3].cells[30].value = '';
    grid.rows[3].cells[31].value = '';

        row1 = grid.rows.add();
    grid.rows[4].cells[0].value = '5';
    grid.rows[4].cells[1].value = nie[4];
    grid.rows[4].cells[2].value = nombre[4];
    grid.rows[4].cells[4].value = '';
    grid.rows[4].cells[4].value = '';
    grid.rows[4].cells[5].value = '';
    grid.rows[4].cells[6].value = '';
    grid.rows[4].cells[7].value = '';
    grid.rows[4].cells[8].value = '';
    grid.rows[4].cells[9].value = p1p1[4];
    grid.rows[4].cells[10].value = p1p2[4];
    grid.rows[4].cells[11].value = op1[4];
    grid.rows[4].cells[12].value = pp1[4];
    grid.rows[4].cells[13].value = p1p2[4];
    grid.rows[4].cells[14].value = p2p2[4];
    grid.rows[4].cells[15].value = op2[4];
    grid.rows[4].cells[16].value = pp2[4];
    grid.rows[4].cells[17].value = p1p3[4];
    grid.rows[4].cells[18].value = p2p3[4];
    grid.rows[4].cells[19].value = op3[4];
    grid.rows[4].cells[20].value = pp3[4];
    grid.rows[4].cells[21].value = p1p4[4];
    grid.rows[4].cells[22].value = p2p4[4];
    grid.rows[4].cells[23].value = op4[4];
    grid.rows[4].cells[24].value = pp4[4];
    grid.rows[4].cells[25].value = ppf[4];
    grid.rows[4].cells[26].value = r1[4];
    grid.rows[4].cells[27].value = r2[4];
    grid.rows[4].cells[28].value = ppt[4];
    grid.rows[4].cells[29].value = rl[4];
    grid.rows[4].cells[30].value = '';
    grid.rows[4].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[5].cells[0].value = '6';
    grid.rows[5].cells[1].value = nie[5];
    grid.rows[5].cells[2].value = nombre[5];
    grid.rows[5].cells[4].value = '';
    grid.rows[5].cells[4].value = '';
    grid.rows[5].cells[5].value = '';
    grid.rows[5].cells[6].value = '';
    grid.rows[5].cells[7].value = '';
    grid.rows[5].cells[8].value = '';
    grid.rows[5].cells[9].value = p1p1[5];
    grid.rows[5].cells[10].value = p1p2[5];
    grid.rows[5].cells[11].value = op1[5];
    grid.rows[5].cells[12].value = pp1[5];
    grid.rows[5].cells[13].value = p1p2[5];
    grid.rows[5].cells[14].value = p2p2[5];
    grid.rows[5].cells[15].value = op2[5];
    grid.rows[5].cells[16].value = pp2[5];
    grid.rows[5].cells[17].value = p1p3[5];
    grid.rows[5].cells[18].value = p2p3[5];
    grid.rows[5].cells[19].value = op3[5];
    grid.rows[5].cells[20].value = pp3[5];
    grid.rows[5].cells[21].value = p1p4[5];
    grid.rows[5].cells[22].value = p2p4[5];
    grid.rows[5].cells[23].value = op4[5];
    grid.rows[5].cells[24].value = pp4[5];
    grid.rows[5].cells[25].value = ppf[5];
    grid.rows[5].cells[26].value = r1[5];
    grid.rows[5].cells[27].value = r2[5];
    grid.rows[5].cells[28].value = ppt[5];
    grid.rows[5].cells[29].value = rl[5];
    grid.rows[5].cells[30].value = '';
    grid.rows[5].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[6].cells[0].value = '7';
    grid.rows[6].cells[1].value = nie[6];
    grid.rows[6].cells[2].value = nombre[6];
    grid.rows[6].cells[4].value = '';
    grid.rows[6].cells[4].value = '';
    grid.rows[6].cells[5].value = '';
    grid.rows[6].cells[6].value = '';
    grid.rows[6].cells[7].value = '';
    grid.rows[6].cells[8].value = '';
    grid.rows[6].cells[9].value = p1p1[6];
    grid.rows[6].cells[10].value = p1p2[6];
    grid.rows[6].cells[11].value = op1[6];
    grid.rows[6].cells[12].value = pp1[6];
    grid.rows[6].cells[13].value = p1p2[6];
    grid.rows[6].cells[14].value = p2p2[6];
    grid.rows[6].cells[15].value = op2[6];
    grid.rows[6].cells[16].value = pp2[6];
    grid.rows[6].cells[17].value = p1p3[6];
    grid.rows[6].cells[18].value = p2p3[6];
    grid.rows[6].cells[19].value = op3[6];
    grid.rows[6].cells[20].value = pp3[6];
    grid.rows[6].cells[21].value = p1p4[6];
    grid.rows[6].cells[22].value = p2p4[6];
    grid.rows[6].cells[23].value = op4[6];
    grid.rows[6].cells[24].value = pp4[6];
    grid.rows[6].cells[25].value = ppf[6];
    grid.rows[6].cells[26].value = r1[6];
    grid.rows[6].cells[27].value = r2[6];
    grid.rows[6].cells[28].value = ppt[6];
    grid.rows[6].cells[29].value = rl[6];
    grid.rows[6].cells[30].value = '';
    grid.rows[6].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[7].cells[0].value = '8';
    grid.rows[7].cells[1].value = nie[7];
    grid.rows[7].cells[2].value = nombre[7];
    grid.rows[7].cells[4].value = '';
    grid.rows[7].cells[4].value = '';
    grid.rows[7].cells[5].value = '';
    grid.rows[7].cells[6].value = '';
    grid.rows[7].cells[7].value = '';
    grid.rows[7].cells[8].value = '';
    grid.rows[7].cells[9].value = p1p1[7];
    grid.rows[7].cells[10].value = p1p2[7];
    grid.rows[7].cells[11].value = op1[7];
    grid.rows[7].cells[12].value = pp1[7];
    grid.rows[7].cells[13].value = p1p2[7];
    grid.rows[7].cells[14].value = p2p2[7];
    grid.rows[7].cells[15].value = op2[7];
    grid.rows[7].cells[16].value = pp2[7];
    grid.rows[7].cells[17].value = p1p3[7];
    grid.rows[7].cells[18].value = p2p3[7];
    grid.rows[7].cells[19].value = op3[7];
    grid.rows[7].cells[20].value = pp3[7];
    grid.rows[7].cells[21].value = p1p4[7];
    grid.rows[7].cells[22].value = p2p4[7];
    grid.rows[7].cells[23].value = op4[7];
    grid.rows[7].cells[24].value = pp4[7];
    grid.rows[7].cells[25].value = ppf[7];
    grid.rows[7].cells[26].value = r1[7];
    grid.rows[7].cells[27].value = r2[7];
    grid.rows[7].cells[28].value = ppt[7];
    grid.rows[7].cells[29].value = rl[7];
    grid.rows[7].cells[30].value = '';
    grid.rows[7].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[8].cells[0].value = '9';
    grid.rows[8].cells[1].value = nie[8];
    grid.rows[8].cells[2].value = nombre[8];
    grid.rows[8].cells[4].value = '';
    grid.rows[8].cells[4].value = '';
    grid.rows[8].cells[5].value = '';
    grid.rows[8].cells[6].value = '';
    grid.rows[8].cells[7].value = '';
    grid.rows[8].cells[8].value = '';
    grid.rows[8].cells[9].value = p1p1[8];
    grid.rows[8].cells[10].value = p1p2[8];
    grid.rows[8].cells[11].value = op1[8];
    grid.rows[8].cells[12].value = pp1[8];
    grid.rows[8].cells[13].value = p1p2[8];
    grid.rows[8].cells[14].value = p2p2[8];
    grid.rows[8].cells[15].value = op2[8];
    grid.rows[8].cells[16].value = pp2[8];
    grid.rows[8].cells[17].value = p1p3[8];
    grid.rows[8].cells[18].value = p2p3[8];
    grid.rows[8].cells[19].value = op3[8];
    grid.rows[8].cells[20].value = pp3[8];
    grid.rows[8].cells[21].value = p1p4[8];
    grid.rows[8].cells[22].value = p2p4[8];
    grid.rows[8].cells[23].value = op4[8];
    grid.rows[8].cells[24].value = pp4[8];
    grid.rows[8].cells[25].value = ppf[8];
    grid.rows[8].cells[26].value = r1[8];
    grid.rows[8].cells[27].value = r2[8];
    grid.rows[8].cells[28].value = ppt[8];
    grid.rows[8].cells[29].value = rl[8];
    grid.rows[8].cells[30].value = '';
    grid.rows[8].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[9].cells[0].value = '10';
    grid.rows[9].cells[1].value = nie[9];
    grid.rows[9].cells[2].value = nombre[9];
    grid.rows[9].cells[4].value = '';
    grid.rows[9].cells[4].value = '';
    grid.rows[9].cells[5].value = '';
    grid.rows[9].cells[6].value = '';
    grid.rows[9].cells[7].value = '';
    grid.rows[9].cells[8].value = '';
    grid.rows[9].cells[9].value = p1p1[9];
    grid.rows[9].cells[10].value = p1p2[9];
    grid.rows[9].cells[11].value = op1[9];
    grid.rows[9].cells[12].value = pp1[9];
    grid.rows[9].cells[13].value = p1p2[9];
    grid.rows[9].cells[14].value = p2p2[9];
    grid.rows[9].cells[15].value = op2[9];
    grid.rows[9].cells[16].value = pp2[9];
    grid.rows[9].cells[17].value = p1p3[9];
    grid.rows[9].cells[18].value = p2p3[9];
    grid.rows[9].cells[19].value = op3[9];
    grid.rows[9].cells[20].value = pp3[9];
    grid.rows[9].cells[21].value = p1p4[9];
    grid.rows[9].cells[22].value = p2p4[9];
    grid.rows[9].cells[23].value = op4[9];
    grid.rows[9].cells[24].value = pp4[9];
    grid.rows[9].cells[25].value = ppf[9];
    grid.rows[9].cells[26].value = r1[9];
    grid.rows[9].cells[27].value = r2[9];
    grid.rows[9].cells[28].value = ppt[9];
    grid.rows[9].cells[29].value = rl[9];
    grid.rows[9].cells[30].value = '';
    grid.rows[9].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[10].cells[0].value = '11';
    grid.rows[10].cells[1].value = nie[10];
    grid.rows[10].cells[2].value = nombre[10];
    grid.rows[10].cells[4].value = '';
    grid.rows[10].cells[4].value = '';
    grid.rows[10].cells[5].value = '';
    grid.rows[10].cells[6].value = '';
    grid.rows[10].cells[7].value = '';
    grid.rows[10].cells[8].value = '';
    grid.rows[10].cells[9].value = p1p1[10];
    grid.rows[10].cells[10].value = p1p2[10];
    grid.rows[10].cells[11].value = op1[10];
    grid.rows[10].cells[12].value = pp1[10];
    grid.rows[10].cells[13].value = p1p2[10];
    grid.rows[10].cells[14].value = p2p2[10];
    grid.rows[10].cells[15].value = op2[10];
    grid.rows[10].cells[16].value = pp2[10];
    grid.rows[10].cells[17].value = p1p3[10];
    grid.rows[10].cells[18].value = p2p3[10];
    grid.rows[10].cells[19].value = op3[10];
    grid.rows[10].cells[20].value = pp3[10];
    grid.rows[10].cells[21].value = p1p4[10];
    grid.rows[10].cells[22].value = p2p4[10];
    grid.rows[10].cells[23].value = op4[10];
    grid.rows[10].cells[24].value = pp4[10];
    grid.rows[10].cells[25].value = ppf[10];
    grid.rows[10].cells[26].value = r1[10];
    grid.rows[10].cells[27].value = r2[10];
    grid.rows[10].cells[28].value = ppt[10];
    grid.rows[10].cells[29].value = rl[10];
    grid.rows[10].cells[30].value = '';
    grid.rows[10].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[11].cells[0].value = '12';
    grid.rows[11].cells[1].value = nie[11];
    grid.rows[11].cells[2].value = nombre[11];
    grid.rows[11].cells[4].value = '';
    grid.rows[11].cells[4].value = '';
    grid.rows[11].cells[5].value = '';
    grid.rows[11].cells[6].value = '';
    grid.rows[11].cells[7].value = '';
    grid.rows[11].cells[8].value = '';
    grid.rows[11].cells[9].value = p1p1[11];
    grid.rows[11].cells[10].value = p1p2[11];
    grid.rows[11].cells[11].value = op1[11];
    grid.rows[11].cells[12].value = pp1[11];
    grid.rows[11].cells[13].value = p1p2[11];
    grid.rows[11].cells[14].value = p2p2[11];
    grid.rows[11].cells[15].value = op2[11];
    grid.rows[11].cells[16].value = pp2[11];
    grid.rows[11].cells[17].value = p1p3[11];
    grid.rows[11].cells[18].value = p2p3[11];
    grid.rows[11].cells[19].value = op3[11];
    grid.rows[11].cells[20].value = pp3[11];
    grid.rows[11].cells[21].value = p1p4[11];
    grid.rows[11].cells[22].value = p2p4[11];
    grid.rows[11].cells[23].value = op4[11];
    grid.rows[11].cells[24].value = pp4[11];
    grid.rows[11].cells[25].value = ppf[11];
    grid.rows[11].cells[26].value = r1[11];
    grid.rows[11].cells[27].value = r2[11];
    grid.rows[11].cells[28].value = ppt[11];
    grid.rows[11].cells[29].value = rl[11];
    grid.rows[11].cells[30].value = '';
    grid.rows[11].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[12].cells[0].value = '13';
    grid.rows[12].cells[1].value = nie[12];
    grid.rows[12].cells[2].value = nombre[12];
    grid.rows[12].cells[4].value = '';
    grid.rows[12].cells[4].value = '';
    grid.rows[12].cells[5].value = '';
    grid.rows[12].cells[6].value = '';
    grid.rows[12].cells[7].value = '';
    grid.rows[12].cells[8].value = '';
    grid.rows[12].cells[9].value = p1p1[12];
    grid.rows[12].cells[10].value = p1p2[12];
    grid.rows[12].cells[11].value = op1[12];
    grid.rows[12].cells[12].value = pp1[12];
    grid.rows[12].cells[13].value = p1p2[12];
    grid.rows[12].cells[14].value = p2p2[12];
    grid.rows[12].cells[15].value = op2[12];
    grid.rows[12].cells[16].value = pp2[12];
    grid.rows[12].cells[17].value = p1p3[12];
    grid.rows[12].cells[18].value = p2p3[12];
    grid.rows[12].cells[19].value = op3[12];
    grid.rows[12].cells[20].value = pp3[12];
    grid.rows[12].cells[21].value = p1p4[12];
    grid.rows[12].cells[22].value = p2p4[12];
    grid.rows[12].cells[23].value = op4[12];
    grid.rows[12].cells[24].value = pp4[12];
    grid.rows[12].cells[25].value = ppf[12];
    grid.rows[12].cells[26].value = r1[12];
    grid.rows[12].cells[27].value = r2[12];
    grid.rows[12].cells[28].value = ppt[12];
    grid.rows[12].cells[29].value = rl[12];
    grid.rows[12].cells[30].value = '';
    grid.rows[12].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[13].cells[0].value = '14';
    grid.rows[13].cells[1].value = nie[13];
    grid.rows[13].cells[2].value = nombre[13];
    grid.rows[13].cells[4].value = '';
    grid.rows[13].cells[4].value = '';
    grid.rows[13].cells[5].value = '';
    grid.rows[13].cells[6].value = '';
    grid.rows[13].cells[7].value = '';
    grid.rows[13].cells[8].value = '';
    grid.rows[13].cells[9].value = p1p1[13];
    grid.rows[13].cells[10].value = p1p2[13];
    grid.rows[13].cells[11].value = op1[13];
    grid.rows[13].cells[12].value = pp1[13];
    grid.rows[13].cells[13].value = p1p2[13];
    grid.rows[13].cells[14].value = p2p2[13];
    grid.rows[13].cells[15].value = op2[13];
    grid.rows[13].cells[16].value = pp2[13];
    grid.rows[13].cells[17].value = p1p3[13];
    grid.rows[13].cells[18].value = p2p3[13];
    grid.rows[13].cells[19].value = op3[13];
    grid.rows[13].cells[20].value = pp3[13];
    grid.rows[13].cells[21].value = p1p4[13];
    grid.rows[13].cells[22].value = p2p4[13];
    grid.rows[13].cells[23].value = op4[13];
    grid.rows[13].cells[24].value = pp4[13];
    grid.rows[13].cells[25].value = ppf[13];
    grid.rows[13].cells[26].value = r1[13];
    grid.rows[13].cells[27].value = r2[13];
    grid.rows[13].cells[28].value = ppt[13];
    grid.rows[13].cells[29].value = rl[13];
    grid.rows[13].cells[30].value = '';
    grid.rows[13].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[14].cells[0].value = '15';
    grid.rows[14].cells[1].value = nie[14];
    grid.rows[14].cells[2].value = nombre[14];
    grid.rows[14].cells[4].value = '';
    grid.rows[14].cells[4].value = '';
    grid.rows[14].cells[5].value = '';
    grid.rows[14].cells[6].value = '';
    grid.rows[14].cells[7].value = '';
    grid.rows[14].cells[8].value = '';
    grid.rows[14].cells[9].value = p1p1[14];
    grid.rows[14].cells[10].value = p1p2[14];
    grid.rows[14].cells[11].value = op1[14];
    grid.rows[14].cells[12].value = pp1[14];
    grid.rows[14].cells[13].value = p1p2[14];
    grid.rows[14].cells[14].value = p2p2[14];
    grid.rows[14].cells[15].value = op2[14];
    grid.rows[14].cells[16].value = pp2[14];
    grid.rows[14].cells[17].value = p1p3[14];
    grid.rows[14].cells[18].value = p2p3[14];
    grid.rows[14].cells[19].value = op3[14];
    grid.rows[14].cells[20].value = pp3[14];
    grid.rows[14].cells[21].value = p1p4[14];
    grid.rows[14].cells[22].value = p2p4[14];
    grid.rows[14].cells[23].value = op4[14];
    grid.rows[14].cells[24].value = pp4[14];
    grid.rows[14].cells[25].value = ppf[14];
    grid.rows[14].cells[26].value = r1[14];
    grid.rows[14].cells[27].value = r2[14];
    grid.rows[14].cells[28].value = ppt[14];
    grid.rows[14].cells[29].value = rl[14];
    grid.rows[14].cells[30].value = '';
    grid.rows[14].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[15].cells[0].value = '16';
    grid.rows[15].cells[1].value = nie[15];
    grid.rows[15].cells[2].value = nombre[15];
    grid.rows[15].cells[4].value = '';
    grid.rows[15].cells[4].value = '';
    grid.rows[15].cells[5].value = '';
    grid.rows[15].cells[6].value = '';
    grid.rows[15].cells[7].value = '';
    grid.rows[15].cells[8].value = '';
    grid.rows[15].cells[9].value = p1p1[15];
    grid.rows[15].cells[10].value = p1p2[15];
    grid.rows[15].cells[11].value = op1[15];
    grid.rows[15].cells[12].value = pp1[15];
    grid.rows[15].cells[13].value = p1p2[15];
    grid.rows[15].cells[14].value = p2p2[15];
    grid.rows[15].cells[15].value = op2[15];
    grid.rows[15].cells[16].value = pp2[15];
    grid.rows[15].cells[17].value = p1p3[15];
    grid.rows[15].cells[18].value = p2p3[15];
    grid.rows[15].cells[19].value = op3[15];
    grid.rows[15].cells[20].value = pp3[15];
    grid.rows[15].cells[21].value = p1p4[15];
    grid.rows[15].cells[22].value = p2p4[15];
    grid.rows[15].cells[23].value = op4[15];
    grid.rows[15].cells[24].value = pp4[15];
    grid.rows[15].cells[25].value = ppf[15];
    grid.rows[15].cells[26].value = r1[15];
    grid.rows[15].cells[27].value = r2[15];
    grid.rows[15].cells[28].value = ppt[15];
    grid.rows[15].cells[29].value = rl[15];
    grid.rows[15].cells[30].value = '';
    grid.rows[15].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[16].cells[0].value = '17';
    grid.rows[16].cells[1].value = nie[16];
    grid.rows[16].cells[2].value = nombre[16];
    grid.rows[16].cells[4].value = '';
    grid.rows[16].cells[4].value = '';
    grid.rows[16].cells[5].value = '';
    grid.rows[16].cells[6].value = '';
    grid.rows[16].cells[7].value = '';
    grid.rows[16].cells[8].value = '';
    grid.rows[16].cells[9].value = p1p1[16];
    grid.rows[16].cells[10].value = p1p2[16];
    grid.rows[16].cells[11].value = op1[16];
    grid.rows[16].cells[12].value = pp1[16];
    grid.rows[16].cells[13].value = p1p2[16];
    grid.rows[16].cells[14].value = p2p2[16];
    grid.rows[16].cells[15].value = op2[16];
    grid.rows[16].cells[16].value = pp2[16];
    grid.rows[16].cells[17].value = p1p3[16];
    grid.rows[16].cells[18].value = p2p3[16];
    grid.rows[16].cells[19].value = op3[16];
    grid.rows[16].cells[20].value = pp3[16];
    grid.rows[16].cells[21].value = p1p4[16];
    grid.rows[16].cells[22].value = p2p4[16];
    grid.rows[16].cells[23].value = op4[16];
    grid.rows[16].cells[24].value = pp4[16];
    grid.rows[16].cells[25].value = ppf[16];
    grid.rows[16].cells[26].value = r1[16];
    grid.rows[16].cells[27].value = r2[16];
    grid.rows[16].cells[28].value = ppt[16];
    grid.rows[16].cells[29].value = rl[16];
    grid.rows[16].cells[30].value = '';
    grid.rows[16].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[17].cells[0].value = '18';
    grid.rows[17].cells[1].value = nie[17];
    grid.rows[17].cells[2].value = nombre[17];
    grid.rows[17].cells[4].value = '';
    grid.rows[17].cells[4].value = '';
    grid.rows[17].cells[5].value = '';
    grid.rows[17].cells[6].value = '';
    grid.rows[17].cells[7].value = '';
    grid.rows[17].cells[8].value = '';
    grid.rows[17].cells[9].value = p1p1[17];
    grid.rows[17].cells[10].value = p1p2[17];
    grid.rows[17].cells[11].value = op1[17];
    grid.rows[17].cells[12].value = pp1[17];
    grid.rows[17].cells[13].value = p1p2[17];
    grid.rows[17].cells[14].value = p2p2[17];
    grid.rows[17].cells[15].value = op2[17];
    grid.rows[17].cells[16].value = pp2[17];
    grid.rows[17].cells[17].value = p1p3[17];
    grid.rows[17].cells[18].value = p2p3[17];
    grid.rows[17].cells[19].value = op3[17];
    grid.rows[17].cells[20].value = pp3[17];
    grid.rows[17].cells[21].value = p1p4[17];
    grid.rows[17].cells[22].value = p2p4[17];
    grid.rows[17].cells[23].value = op4[17];
    grid.rows[17].cells[24].value = pp4[17];
    grid.rows[17].cells[25].value = ppf[17];
    grid.rows[17].cells[26].value = r1[17];
    grid.rows[17].cells[27].value = r2[17];
    grid.rows[17].cells[28].value = ppt[17];
    grid.rows[17].cells[29].value = rl[17];
    grid.rows[17].cells[30].value = '';
    grid.rows[17].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[18].cells[0].value = '19';
    grid.rows[18].cells[1].value = nie[18];
    grid.rows[18].cells[2].value = nombre[18];
    grid.rows[18].cells[4].value = '';
    grid.rows[18].cells[4].value = '';
    grid.rows[18].cells[5].value = '';
    grid.rows[18].cells[6].value = '';
    grid.rows[18].cells[7].value = '';
    grid.rows[18].cells[8].value = '';
    grid.rows[18].cells[9].value = p1p1[18];
    grid.rows[18].cells[10].value = p1p2[18];
    grid.rows[18].cells[11].value = op1[18];
    grid.rows[18].cells[12].value = pp1[18];
    grid.rows[18].cells[13].value = p1p2[18];
    grid.rows[18].cells[14].value = p2p2[18];
    grid.rows[18].cells[15].value = op2[18];
    grid.rows[18].cells[16].value = pp2[18];
    grid.rows[18].cells[17].value = p1p3[18];
    grid.rows[18].cells[18].value = p2p3[18];
    grid.rows[18].cells[19].value = op3[18];
    grid.rows[18].cells[20].value = pp3[18];
    grid.rows[18].cells[21].value = p1p4[18];
    grid.rows[18].cells[22].value = p2p4[18];
    grid.rows[18].cells[23].value = op4[18];
    grid.rows[18].cells[24].value = pp4[18];
    grid.rows[18].cells[25].value = ppf[18];
    grid.rows[18].cells[26].value = r1[18];
    grid.rows[18].cells[27].value = r2[18];
    grid.rows[18].cells[28].value = ppt[18];
    grid.rows[18].cells[29].value = rl[18];
    grid.rows[18].cells[30].value = '';
    grid.rows[18].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[19].cells[0].value = '20';
    grid.rows[19].cells[1].value = nie[19];
    grid.rows[19].cells[2].value = nombre[19];
    grid.rows[19].cells[4].value = '';
    grid.rows[19].cells[4].value = '';
    grid.rows[19].cells[5].value = '';
    grid.rows[19].cells[6].value = '';
    grid.rows[19].cells[7].value = '';
    grid.rows[19].cells[8].value = '';
    grid.rows[19].cells[9].value = p1p1[19];
    grid.rows[19].cells[10].value = p1p2[19];
    grid.rows[19].cells[11].value = op1[19];
    grid.rows[19].cells[12].value = pp1[19];
    grid.rows[19].cells[13].value = p1p2[19];
    grid.rows[19].cells[14].value = p2p2[19];
    grid.rows[19].cells[15].value = op2[19];
    grid.rows[19].cells[16].value = pp2[19];
    grid.rows[19].cells[17].value = p1p3[19];
    grid.rows[19].cells[18].value = p2p3[19];
    grid.rows[19].cells[19].value = op3[19];
    grid.rows[19].cells[20].value = pp3[19];
    grid.rows[19].cells[21].value = p1p4[19];
    grid.rows[19].cells[22].value = p2p4[19];
    grid.rows[19].cells[23].value = op4[19];
    grid.rows[19].cells[24].value = pp4[19];
    grid.rows[19].cells[25].value = ppf[19];
    grid.rows[19].cells[26].value = r1[19];
    grid.rows[19].cells[27].value = r2[19];
    grid.rows[19].cells[28].value = ppt[19];
    grid.rows[19].cells[29].value = rl[19];
    grid.rows[19].cells[30].value = '';
    grid.rows[19].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[20].cells[0].value = '21';
    grid.rows[20].cells[1].value = nie[20];
    grid.rows[20].cells[2].value = nombre[20];
    grid.rows[20].cells[4].value = '';
    grid.rows[20].cells[4].value = '';
    grid.rows[20].cells[5].value = '';
    grid.rows[20].cells[6].value = '';
    grid.rows[20].cells[7].value = '';
    grid.rows[20].cells[8].value = '';
    grid.rows[20].cells[9].value = p1p1[20];
    grid.rows[20].cells[10].value = p1p2[20];
    grid.rows[20].cells[11].value = op1[20];
    grid.rows[20].cells[12].value = pp1[20];
    grid.rows[20].cells[13].value = p1p2[20];
    grid.rows[20].cells[14].value = p2p2[20];
    grid.rows[20].cells[15].value = op2[20];
    grid.rows[20].cells[16].value = pp2[20];
    grid.rows[20].cells[17].value = p1p3[20];
    grid.rows[20].cells[18].value = p2p3[20];
    grid.rows[20].cells[19].value = op3[20];
    grid.rows[20].cells[20].value = pp3[20];
    grid.rows[20].cells[21].value = p1p4[20];
    grid.rows[20].cells[22].value = p2p4[20];
    grid.rows[20].cells[23].value = op4[20];
    grid.rows[20].cells[24].value = pp4[20];
    grid.rows[20].cells[25].value = ppf[20];
    grid.rows[20].cells[26].value = r1[20];
    grid.rows[20].cells[27].value = r2[20];
    grid.rows[20].cells[28].value = ppt[20];
    grid.rows[20].cells[29].value = rl[20];
    grid.rows[20].cells[30].value = '';
    grid.rows[20].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[21].cells[0].value = '22';
    grid.rows[21].cells[1].value = nie[21];
    grid.rows[21].cells[2].value = nombre[21];
    grid.rows[21].cells[4].value = '';
    grid.rows[21].cells[4].value = '';
    grid.rows[21].cells[5].value = '';
    grid.rows[21].cells[6].value = '';
    grid.rows[21].cells[7].value = '';
    grid.rows[21].cells[8].value = '';
    grid.rows[21].cells[9].value = p1p1[21];
    grid.rows[21].cells[10].value = p1p2[21];
    grid.rows[21].cells[11].value = op1[21];
    grid.rows[21].cells[12].value = pp1[21];
    grid.rows[21].cells[13].value = p1p2[21];
    grid.rows[21].cells[14].value = p2p2[21];
    grid.rows[21].cells[15].value = op2[21];
    grid.rows[21].cells[16].value = pp2[21];
    grid.rows[21].cells[17].value = p1p3[21];
    grid.rows[21].cells[18].value = p2p3[21];
    grid.rows[21].cells[19].value = op3[21];
    grid.rows[21].cells[20].value = pp3[21];
    grid.rows[21].cells[21].value = p1p4[21];
    grid.rows[21].cells[22].value = p2p4[21];
    grid.rows[21].cells[23].value = op4[21];
    grid.rows[21].cells[24].value = pp4[21];
    grid.rows[21].cells[25].value = ppf[21];
    grid.rows[21].cells[26].value = r1[21];
    grid.rows[21].cells[27].value = r2[21];
    grid.rows[21].cells[28].value = ppt[21];
    grid.rows[21].cells[29].value = rl[21];
    grid.rows[21].cells[30].value = '';
    grid.rows[21].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[22].cells[0].value = '23';
    grid.rows[22].cells[1].value = nie[22];
    grid.rows[22].cells[2].value = nombre[22];
    grid.rows[22].cells[4].value = '';
    grid.rows[22].cells[4].value = '';
    grid.rows[22].cells[5].value = '';
    grid.rows[22].cells[6].value = '';
    grid.rows[22].cells[7].value = '';
    grid.rows[22].cells[8].value = '';
    grid.rows[22].cells[9].value = p1p1[22];
    grid.rows[22].cells[10].value = p1p2[22];
    grid.rows[22].cells[11].value = op1[22];
    grid.rows[22].cells[12].value = pp1[22];
    grid.rows[22].cells[13].value = p1p2[22];
    grid.rows[22].cells[14].value = p2p2[22];
    grid.rows[22].cells[15].value = op2[22];
    grid.rows[22].cells[16].value = pp2[22];
    grid.rows[22].cells[17].value = p1p3[22];
    grid.rows[22].cells[18].value = p2p3[22];
    grid.rows[22].cells[19].value = op3[22];
    grid.rows[22].cells[20].value = pp3[22];
    grid.rows[22].cells[21].value = p1p4[22];
    grid.rows[22].cells[22].value = p2p4[22];
    grid.rows[22].cells[23].value = op4[22];
    grid.rows[22].cells[24].value = pp4[22];
    grid.rows[22].cells[25].value = ppf[22];
    grid.rows[22].cells[26].value = r1[22];
    grid.rows[22].cells[27].value = r2[22];
    grid.rows[22].cells[28].value = ppt[22];
    grid.rows[22].cells[29].value = rl[22];
    grid.rows[22].cells[30].value = '';
    grid.rows[22].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[23].cells[0].value = '24';
    grid.rows[23].cells[1].value = nie[23];
    grid.rows[23].cells[2].value = nombre[23];
    grid.rows[23].cells[4].value = '';
    grid.rows[23].cells[4].value = '';
    grid.rows[23].cells[5].value = '';
    grid.rows[23].cells[6].value = '';
    grid.rows[23].cells[7].value = '';
    grid.rows[23].cells[8].value = '';
    grid.rows[23].cells[9].value = p1p1[23];
    grid.rows[23].cells[10].value = p1p2[23];
    grid.rows[23].cells[11].value = op1[23];
    grid.rows[23].cells[12].value = pp1[23];
    grid.rows[23].cells[13].value = p1p2[23];
    grid.rows[23].cells[14].value = p2p2[23];
    grid.rows[23].cells[15].value = op2[23];
    grid.rows[23].cells[16].value = pp2[23];
    grid.rows[23].cells[17].value = p1p3[23];
    grid.rows[23].cells[18].value = p2p3[23];
    grid.rows[23].cells[19].value = op3[23];
    grid.rows[23].cells[20].value = pp3[23];
    grid.rows[23].cells[21].value = p1p4[23];
    grid.rows[23].cells[22].value = p2p4[23];
    grid.rows[23].cells[23].value = op4[23];
    grid.rows[23].cells[24].value = pp4[23];
    grid.rows[23].cells[25].value = ppf[23];
    grid.rows[23].cells[26].value = r1[23];
    grid.rows[23].cells[27].value = r2[23];
    grid.rows[23].cells[28].value = ppt[23];
    grid.rows[23].cells[29].value = rl[23];
    grid.rows[23].cells[30].value = '';
    grid.rows[23].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[24].cells[0].value = '25';
    grid.rows[24].cells[1].value = nie[24];
    grid.rows[24].cells[2].value = nombre[24];
    grid.rows[24].cells[4].value = '';
    grid.rows[24].cells[4].value = '';
    grid.rows[24].cells[5].value = '';
    grid.rows[24].cells[6].value = '';
    grid.rows[24].cells[7].value = '';
    grid.rows[24].cells[8].value = '';
    grid.rows[24].cells[9].value = p1p1[24];
    grid.rows[24].cells[10].value = p1p2[24];
    grid.rows[24].cells[11].value = op1[24];
    grid.rows[24].cells[12].value = pp1[24];
    grid.rows[24].cells[13].value = p1p2[24];
    grid.rows[24].cells[14].value = p2p2[24];
    grid.rows[24].cells[15].value = op2[24];
    grid.rows[24].cells[16].value = pp2[24];
    grid.rows[24].cells[17].value = p1p3[24];
    grid.rows[24].cells[18].value = p2p3[24];
    grid.rows[24].cells[19].value = op3[24];
    grid.rows[24].cells[20].value = pp3[24];
    grid.rows[24].cells[21].value = p1p4[24];
    grid.rows[24].cells[22].value = p2p4[24];
    grid.rows[24].cells[23].value = op4[24];
    grid.rows[24].cells[24].value = pp4[24];
    grid.rows[24].cells[25].value = ppf[24];
    grid.rows[24].cells[26].value = r1[24];
    grid.rows[24].cells[27].value = r2[24];
    grid.rows[24].cells[28].value = ppt[24];
    grid.rows[24].cells[29].value = rl[24];
    grid.rows[24].cells[30].value = '';
    grid.rows[24].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[25].cells[0].value = '26';
    grid.rows[25].cells[1].value = nie[25];
    grid.rows[25].cells[2].value = nombre[25];
    grid.rows[25].cells[4].value = '';
    grid.rows[25].cells[4].value = '';
    grid.rows[25].cells[5].value = '';
    grid.rows[25].cells[6].value = '';
    grid.rows[25].cells[7].value = '';
    grid.rows[25].cells[8].value = '';
    grid.rows[25].cells[9].value = p1p1[25];
    grid.rows[25].cells[10].value = p1p2[25];
    grid.rows[25].cells[11].value = op1[25];
    grid.rows[25].cells[12].value = pp1[25];
    grid.rows[25].cells[13].value = p1p2[25];
    grid.rows[25].cells[14].value = p2p2[25];
    grid.rows[25].cells[15].value = op2[25];
    grid.rows[25].cells[16].value = pp2[25];
    grid.rows[25].cells[17].value = p1p3[25];
    grid.rows[25].cells[18].value = p2p3[25];
    grid.rows[25].cells[19].value = op3[25];
    grid.rows[25].cells[20].value = pp3[25];
    grid.rows[25].cells[21].value = p1p4[25];
    grid.rows[25].cells[22].value = p2p4[25];
    grid.rows[25].cells[23].value = op4[25];
    grid.rows[25].cells[24].value = pp4[25];
    grid.rows[25].cells[25].value = ppf[25];
    grid.rows[25].cells[26].value = r1[25];
    grid.rows[25].cells[27].value = r2[25];
    grid.rows[25].cells[28].value = ppt[25];
    grid.rows[25].cells[29].value = rl[25];
    grid.rows[25].cells[30].value = '';
    grid.rows[25].cells[31].value = '';


    row1 = grid.rows.add();
    grid.rows[26].cells[0].value = '27';
    grid.rows[26].cells[1].value = nie[26];
    grid.rows[26].cells[2].value = nombre[26];
    grid.rows[26].cells[4].value = '';
    grid.rows[26].cells[4].value = '';
    grid.rows[26].cells[5].value = '';
    grid.rows[26].cells[6].value = '';
    grid.rows[26].cells[7].value = '';
    grid.rows[26].cells[8].value = '';
    grid.rows[26].cells[9].value = p1p1[26];
    grid.rows[26].cells[10].value = p1p2[26];
    grid.rows[26].cells[11].value = op1[26];
    grid.rows[26].cells[12].value = pp1[26];
    grid.rows[26].cells[13].value = p1p2[26];
    grid.rows[26].cells[14].value = p2p2[26];
    grid.rows[26].cells[15].value = op2[26];
    grid.rows[26].cells[16].value = pp2[26];
    grid.rows[26].cells[17].value = p1p3[26];
    grid.rows[26].cells[18].value = p2p3[26];
    grid.rows[26].cells[19].value = op3[26];
    grid.rows[26].cells[20].value = pp3[26];
    grid.rows[26].cells[21].value = p1p4[26];
    grid.rows[26].cells[22].value = p2p4[26];
    grid.rows[26].cells[23].value = op4[26];
    grid.rows[26].cells[24].value = pp4[26];
    grid.rows[26].cells[25].value = ppf[26];
    grid.rows[26].cells[26].value = r1[26];
    grid.rows[26].cells[27].value = r2[26];
    grid.rows[26].cells[28].value = ppt[26];
    grid.rows[26].cells[29].value = rl[26];
    grid.rows[26].cells[30].value = '';
    grid.rows[26].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[27].cells[0].value = '28';
    grid.rows[27].cells[1].value = nie[27];
    grid.rows[27].cells[2].value = nombre[27];
    grid.rows[27].cells[4].value = '';
    grid.rows[27].cells[4].value = '';
    grid.rows[27].cells[5].value = '';
    grid.rows[27].cells[6].value = '';
    grid.rows[27].cells[7].value = '';
    grid.rows[27].cells[8].value = '';
    grid.rows[27].cells[9].value = p1p1[27];
    grid.rows[27].cells[10].value = p1p2[27];
    grid.rows[27].cells[11].value = op1[27];
    grid.rows[27].cells[12].value = pp1[27];
    grid.rows[27].cells[13].value = p1p2[27];
    grid.rows[27].cells[14].value = p2p2[27];
    grid.rows[27].cells[15].value = op2[27];
    grid.rows[27].cells[16].value = pp2[27];
    grid.rows[27].cells[17].value = p1p3[27];
    grid.rows[27].cells[18].value = p2p3[27];
    grid.rows[27].cells[19].value = op3[27];
    grid.rows[27].cells[20].value = pp3[27];
    grid.rows[27].cells[21].value = p1p4[27];
    grid.rows[27].cells[22].value = p2p4[27];
    grid.rows[27].cells[23].value = op4[27];
    grid.rows[27].cells[24].value = pp4[27];
    grid.rows[27].cells[25].value = ppf[27];
    grid.rows[27].cells[26].value = r1[27];
    grid.rows[27].cells[27].value = r2[27];
    grid.rows[27].cells[28].value = ppt[27];
    grid.rows[27].cells[29].value = rl[27];
    grid.rows[27].cells[30].value = '';
    grid.rows[27].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[28].cells[0].value = '29';
    grid.rows[28].cells[1].value = nie[28];
    grid.rows[28].cells[2].value = nombre[28];
    grid.rows[28].cells[4].value = '';
    grid.rows[28].cells[4].value = '';
    grid.rows[28].cells[5].value = '';
    grid.rows[28].cells[6].value = '';
    grid.rows[28].cells[7].value = '';
    grid.rows[28].cells[8].value = '';
    grid.rows[28].cells[9].value = p1p1[28];
    grid.rows[28].cells[10].value = p1p2[28];
    grid.rows[28].cells[11].value = op1[28];
    grid.rows[28].cells[12].value = pp1[28];
    grid.rows[28].cells[13].value = p1p2[28];
    grid.rows[28].cells[14].value = p2p2[28];
    grid.rows[28].cells[15].value = op2[28];
    grid.rows[28].cells[16].value = pp2[28];
    grid.rows[28].cells[17].value = p1p3[28];
    grid.rows[28].cells[18].value = p2p3[28];
    grid.rows[28].cells[19].value = op3[28];
    grid.rows[28].cells[20].value = pp3[28];
    grid.rows[28].cells[21].value = p1p4[28];
    grid.rows[28].cells[22].value = p2p4[28];
    grid.rows[28].cells[23].value = op4[28];
    grid.rows[28].cells[24].value = pp4[28];
    grid.rows[28].cells[25].value = ppf[28];
    grid.rows[28].cells[26].value = r1[28];
    grid.rows[28].cells[27].value = r2[28];
    grid.rows[28].cells[28].value = ppt[28];
    grid.rows[28].cells[29].value = rl[28];
    grid.rows[28].cells[30].value = '';
    grid.rows[28].cells[31].value = '';

    row1 = grid.rows.add();
    grid.rows[29].cells[0].value = '30';
    grid.rows[29].cells[1].value = nie[29];
    grid.rows[29].cells[2].value = nombre[29];
    grid.rows[29].cells[4].value = '';
    grid.rows[29].cells[4].value = '';
    grid.rows[29].cells[5].value = '';
    grid.rows[29].cells[6].value = '';
    grid.rows[29].cells[7].value = '';
    grid.rows[29].cells[8].value = '';
    grid.rows[29].cells[9].value = p1p1[29];
    grid.rows[29].cells[10].value = p1p2[29];
    grid.rows[29].cells[11].value = op1[29];
    grid.rows[29].cells[12].value = pp1[29];
    grid.rows[29].cells[13].value = p1p2[29];
    grid.rows[29].cells[14].value = p2p2[29];
    grid.rows[29].cells[15].value = op2[29];
    grid.rows[29].cells[16].value = pp2[29];
    grid.rows[29].cells[17].value = p1p3[29];
    grid.rows[29].cells[18].value = p2p3[29];
    grid.rows[29].cells[19].value = op3[29];
    grid.rows[29].cells[20].value = pp3[29];
    grid.rows[29].cells[21].value = p1p4[29];
    grid.rows[29].cells[22].value = p2p4[29];
    grid.rows[29].cells[23].value = op4[29];
    grid.rows[29].cells[24].value = pp4[29];
    grid.rows[29].cells[25].value = ppf[29];
    grid.rows[29].cells[26].value = r1[29];
    grid.rows[29].cells[27].value = r2[29];
    grid.rows[29].cells[28].value = ppt[29];
    grid.rows[29].cells[29].value = rl[29];
    grid.rows[29].cells[30].value = '';
    grid.rows[29].cells[31].value = '';

  
    //combinacion de celdas de la cabecera
    grid.headers[0].cells[3].columnSpan = 6;
    grid.headers[0].cells[1].columnSpan = 2;
    grid.headers[0].cells[9].columnSpan = 4;
    grid.headers[0].cells[13].columnSpan = 4;
    grid.headers[0].cells[17].columnSpan = 4;
    grid.headers[0].cells[21].columnSpan = 4;
    grid.headers[0].cells[29].columnSpan = 3;

    //Combinacion de celdas de las filas
    //fila 1
    grid.rows[0].cells[1].columnSpan = 2;
    grid.rows[0].cells[3].columnSpan = 6;
    grid.rows[0].cells[29].columnSpan = 3;
    //fila 2
    grid.rows[1].cells[1].columnSpan = 2;
    grid.rows[1].cells[3].columnSpan = 6;
    grid.rows[1].cells[29].columnSpan = 3;
    //fila 3
    grid.rows[2].cells[1].columnSpan = 2;
    grid.rows[2].cells[3].columnSpan = 6;
    grid.rows[2].cells[29].columnSpan = 3;
    //fila 4
    grid.rows[3].cells[1].columnSpan = 2;
    grid.rows[3].cells[3].columnSpan = 6;
    grid.rows[3].cells[29].columnSpan = 3;
    //fila 5
    grid.rows[4].cells[1].columnSpan = 2;
    grid.rows[4].cells[3].columnSpan = 6;
    grid.rows[4].cells[29].columnSpan = 3;
    //fila 6
    grid.rows[5].cells[1].columnSpan = 2;
    grid.rows[5].cells[3].columnSpan = 6;
    grid.rows[5].cells[29].columnSpan = 3;
    //fila 7
    grid.rows[6].cells[1].columnSpan = 2;
    grid.rows[6].cells[3].columnSpan = 6;
    grid.rows[6].cells[29].columnSpan = 3;
    //fila 8
    grid.rows[7].cells[1].columnSpan = 2;
    grid.rows[7].cells[3].columnSpan = 6;
    grid.rows[7].cells[29].columnSpan = 3;
    //fila 9
    grid.rows[8].cells[1].columnSpan = 2;
    grid.rows[8].cells[3].columnSpan = 6;
    grid.rows[8].cells[29].columnSpan = 3;
    //fila 10
    grid.rows[9].cells[1].columnSpan = 2;
    grid.rows[9].cells[3].columnSpan = 6;
    grid.rows[9].cells[29].columnSpan = 3;
    //fila 11
    grid.rows[10].cells[1].columnSpan = 2;
    grid.rows[10].cells[3].columnSpan = 6;
    grid.rows[10].cells[29].columnSpan = 3;
    //fila 12
    grid.rows[11].cells[1].columnSpan = 2;
    grid.rows[11].cells[3].columnSpan = 6;
    grid.rows[11].cells[29].columnSpan = 3;
    //fila 13
    grid.rows[12].cells[1].columnSpan = 2;
    grid.rows[12].cells[3].columnSpan = 6;
    grid.rows[12].cells[29].columnSpan = 3;
    //fila 14
    grid.rows[13].cells[1].columnSpan = 2;
    grid.rows[13].cells[3].columnSpan = 6;
    grid.rows[13].cells[29].columnSpan = 3;
    //fila 15
    grid.rows[14].cells[1].columnSpan = 2;
    grid.rows[14].cells[3].columnSpan = 6;
    grid.rows[14].cells[29].columnSpan = 3;
    //fila 16
    grid.rows[15].cells[1].columnSpan = 2;
    grid.rows[15].cells[3].columnSpan = 6;
    grid.rows[15].cells[29].columnSpan = 3;
    //fila 17
    grid.rows[16].cells[1].columnSpan = 2;
    grid.rows[16].cells[3].columnSpan = 6;
    grid.rows[16].cells[29].columnSpan = 3;
    //fila 18
    grid.rows[17].cells[1].columnSpan = 2;
    grid.rows[17].cells[3].columnSpan = 6;
    grid.rows[17].cells[29].columnSpan = 3;
    //fila 19
    grid.rows[18].cells[1].columnSpan = 2;
    grid.rows[18].cells[3].columnSpan = 6;
    grid.rows[18].cells[29].columnSpan = 3;
    //fila 20
    grid.rows[19].cells[1].columnSpan = 2;
    grid.rows[19].cells[3].columnSpan = 6;
    grid.rows[19].cells[29].columnSpan = 3;
    //fila 21
    grid.rows[20].cells[1].columnSpan = 2;
    grid.rows[20].cells[3].columnSpan = 6;
    grid.rows[20].cells[29].columnSpan = 3;
    //fila 22
    grid.rows[21].cells[1].columnSpan = 2;
    grid.rows[21].cells[3].columnSpan = 6;
    grid.rows[21].cells[29].columnSpan = 3;
    //fila 23
    grid.rows[22].cells[1].columnSpan = 2;
    grid.rows[22].cells[3].columnSpan = 6;
    grid.rows[22].cells[29].columnSpan = 3;
    //fila 24
    grid.rows[23].cells[1].columnSpan = 2;
    grid.rows[23].cells[3].columnSpan = 6;
    grid.rows[23].cells[29].columnSpan = 3;
    //fila 25
    grid.rows[24].cells[1].columnSpan = 2;
    grid.rows[24].cells[3].columnSpan = 6;
    grid.rows[24].cells[29].columnSpan = 3;
    //fila 26
    grid.rows[25].cells[1].columnSpan = 2;
    grid.rows[25].cells[3].columnSpan = 6;
    grid.rows[25].cells[29].columnSpan = 3;
    //fila 27
    grid.rows[26].cells[1].columnSpan = 2;
    grid.rows[26].cells[3].columnSpan = 6;
    grid.rows[26].cells[29].columnSpan = 3;
    //fila 28
    grid.rows[27].cells[1].columnSpan = 2;
    grid.rows[27].cells[3].columnSpan = 6;
    grid.rows[27].cells[29].columnSpan = 3;
    //fila 29
    grid.rows[28].cells[1].columnSpan = 2;
    grid.rows[28].cells[3].columnSpan = 6;
    grid.rows[28].cells[29].columnSpan = 3;
    //fila 30
    grid.rows[29].cells[1].columnSpan = 2;
    grid.rows[29].cells[3].columnSpan = 6;
    grid.rows[29].cells[29].columnSpan = 3;

    final PdfGridCellStyle cellStyle2 = PdfGridCellStyle();
    cellStyle.stringFormat = PdfStringFormat();
    cellStyle.stringFormat?.alignment = PdfTextAlignment.center;

    // Establecer el formato de alineación del texto
    final PdfStringFormat headerFormat = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );

    // Aplicar el formato de alineación del texto a las celdas de las filas
    for (int i = 0; i < grid.rows.count; i++) {
      final PdfGridRow row = grid.rows[i];
      for (int j = 0; j < row.cells.count; j++) {
        final PdfGridCell cell = row.cells[j];
        cell.style.stringFormat = headerFormat;
      }
    }

    grid.draw(page: page, bounds: const Rect.fromLTWH(50, 50, 610, 590));

    final bytes = await pdfDocument.save();
    pdfDocument.dispose();

    saveLaunchFile(bytes, 'Boleta de notas.pdf');
  }