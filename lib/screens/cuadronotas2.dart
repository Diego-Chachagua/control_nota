// ignore_for_file: avoid_print, unused_local_variable

import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../developer/consultasj.dart';
import 'guardarbol.dart';

void generatepdf2(var anios, var materia1, var seccion ) async {
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
      text: 'Grado:#',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );

    final PdfTextElement textElement2 = PdfTextElement(
      text: 'Seccion:#',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );

    final PdfTextElement textElement3 = PdfTextElement(
      text: 'Año:#',
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
    grid.columns.add(count: 33);
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
    header.cells[27].value = 'AVANZO';
    header.cells[28].value = 'R2';
    header.cells[29].value = 'PF';
    header.cells[30].value = 'RESULTADO';
    header.cells[31].value = '';
    header.cells[32].value = '';

// Cambiar el ancho de la primera columna
    grid.columns[0].width = 13; // Establecer el ancho deseado de la columna
    grid.columns[27].width = 35;

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

    subGrid.draw(page: page, bounds: const Rect.fromLTWH(195, 65, 261, 510));
    subGrid.draw(page: page, bounds: const Rect.fromLTWH(261, 65, 327, 510));
    subGrid.draw(page: page, bounds: const Rect.fromLTWH(327, 65, 275, 510));
    subGrid.draw(page: page, bounds: const Rect.fromLTWH(393, 65, 269, 510));

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
    header.cells[30].style = middleCellStyle;
    // ...

    PdfGridRow row1 = grid.rows.add();
    grid.rows[0].cells[0].value = '';
    grid.rows[0].cells[1].value = '';
    grid.rows[0].cells[2].value = '';
    grid.rows[0].cells[3].value = '';
    grid.rows[0].cells[4].value = '';
    grid.rows[0].cells[5].value = '';
    grid.rows[0].cells[6].value = '';
    grid.rows[0].cells[7].value = '';
    grid.rows[0].cells[8].value = '';
    grid.rows[0].cells[9].value = '';
    grid.rows[0].cells[10].value = '';
    grid.rows[0].cells[11].value = '';
    grid.rows[0].cells[12].value = '';
    grid.rows[0].cells[13].value = '';
    grid.rows[0].cells[14].value = '';
    grid.rows[0].cells[15].value = '';
    grid.rows[0].cells[16].value = '';
    grid.rows[0].cells[17].value = '';
    grid.rows[0].cells[18].value = '';
    grid.rows[0].cells[19].value = '';
    grid.rows[0].cells[20].value = '';
    grid.rows[0].cells[21].value = '';
    grid.rows[0].cells[22].value = '';
    grid.rows[0].cells[23].value = '';
    grid.rows[0].cells[24].value = '';
    grid.rows[0].cells[25].value = '';
    grid.rows[0].cells[26].value = '';
    grid.rows[0].cells[27].value = '';
    grid.rows[0].cells[28].value = '';
    grid.rows[0].cells[29].value = '';
    grid.rows[0].cells[30].value = '';
    grid.rows[0].cells[31].value = '';
    grid.rows[0].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[1].cells[0].value = '';
    grid.rows[1].cells[1].value = '';
    grid.rows[1].cells[2].value = '';
    grid.rows[1].cells[3].value = '';
    grid.rows[1].cells[4].value = '';
    grid.rows[1].cells[5].value = '';
    grid.rows[1].cells[6].value = '';
    grid.rows[1].cells[7].value = '';
    grid.rows[1].cells[8].value = '';
    grid.rows[1].cells[9].value = '';
    grid.rows[1].cells[10].value = '';
    grid.rows[1].cells[11].value = '';
    grid.rows[1].cells[12].value = '';
    grid.rows[1].cells[13].value = '';
    grid.rows[1].cells[14].value = '';
    grid.rows[1].cells[15].value = '';
    grid.rows[1].cells[16].value = '';
    grid.rows[1].cells[17].value = '';
    grid.rows[1].cells[18].value = '';
    grid.rows[1].cells[19].value = '';
    grid.rows[1].cells[20].value = '';
    grid.rows[1].cells[21].value = '';
    grid.rows[1].cells[22].value = '';
    grid.rows[1].cells[23].value = '';
    grid.rows[1].cells[24].value = '';
    grid.rows[1].cells[25].value = '';
    grid.rows[1].cells[26].value = '';
    grid.rows[1].cells[27].value = '';
    grid.rows[1].cells[28].value = '';
    grid.rows[1].cells[29].value = '';
    grid.rows[1].cells[30].value = '';
    grid.rows[1].cells[31].value = '';
    grid.rows[1].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[2].cells[0].value = '';
    grid.rows[2].cells[1].value = '';
    grid.rows[2].cells[2].value = '';
    grid.rows[2].cells[3].value = '';
    grid.rows[2].cells[4].value = '';
    grid.rows[2].cells[5].value = '';
    grid.rows[2].cells[6].value = '';
    grid.rows[2].cells[7].value = '';
    grid.rows[2].cells[8].value = '';
    grid.rows[2].cells[9].value = '';
    grid.rows[2].cells[10].value = '';
    grid.rows[2].cells[11].value = '';
    grid.rows[2].cells[12].value = '';
    grid.rows[2].cells[13].value = '';
    grid.rows[2].cells[14].value = '';
    grid.rows[2].cells[15].value = '';
    grid.rows[2].cells[16].value = '';
    grid.rows[2].cells[17].value = '';
    grid.rows[2].cells[18].value = '';
    grid.rows[2].cells[19].value = '';
    grid.rows[2].cells[20].value = '';
    grid.rows[2].cells[21].value = '';
    grid.rows[2].cells[22].value = '';
    grid.rows[2].cells[23].value = '';
    grid.rows[2].cells[24].value = '';
    grid.rows[2].cells[25].value = '';
    grid.rows[2].cells[26].value = '';
    grid.rows[2].cells[28].value = '';
    grid.rows[2].cells[29].value = '';
    grid.rows[2].cells[30].value = '';
    grid.rows[2].cells[31].value = '';
    grid.rows[2].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[3].cells[0].value = '';
    grid.rows[3].cells[1].value = '';
    grid.rows[3].cells[2].value = '';
    grid.rows[3].cells[3].value = '';
    grid.rows[3].cells[4].value = '';
    grid.rows[3].cells[5].value = '';
    grid.rows[3].cells[6].value = '';
    grid.rows[3].cells[7].value = '';
    grid.rows[3].cells[8].value = '';
    grid.rows[3].cells[9].value = '';
    grid.rows[3].cells[10].value = '';
    grid.rows[3].cells[11].value = '';
    grid.rows[3].cells[12].value = '';
    grid.rows[3].cells[13].value = '';
    grid.rows[3].cells[14].value = '';
    grid.rows[3].cells[15].value = '';
    grid.rows[3].cells[16].value = '';
    grid.rows[3].cells[17].value = '';
    grid.rows[3].cells[18].value = '';
    grid.rows[3].cells[19].value = '';
    grid.rows[3].cells[20].value = '';
    grid.rows[3].cells[21].value = '';
    grid.rows[3].cells[22].value = '';
    grid.rows[3].cells[23].value = '';
    grid.rows[3].cells[24].value = '';
    grid.rows[3].cells[25].value = '';
    grid.rows[3].cells[26].value = '';
    grid.rows[3].cells[27].value = '';
    grid.rows[3].cells[28].value = '';
    grid.rows[3].cells[29].value = '';
    grid.rows[3].cells[30].value = '';
    grid.rows[3].cells[31].value = '';
    grid.rows[3].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[4].cells[0].value = '';
    grid.rows[4].cells[1].value = '';
    grid.rows[4].cells[2].value = '';
    grid.rows[4].cells[3].value = '';
    grid.rows[4].cells[4].value = '';
    grid.rows[4].cells[5].value = '';
    grid.rows[4].cells[6].value = '';
    grid.rows[4].cells[7].value = '';
    grid.rows[4].cells[8].value = '';
    grid.rows[4].cells[9].value = '';
    grid.rows[4].cells[10].value = '';
    grid.rows[4].cells[11].value = '';
    grid.rows[4].cells[12].value = '';
    grid.rows[4].cells[13].value = '';
    grid.rows[4].cells[14].value = '';
    grid.rows[4].cells[15].value = '';
    grid.rows[4].cells[16].value = '';
    grid.rows[4].cells[17].value = '';
    grid.rows[3].cells[18].value = '';
    grid.rows[4].cells[19].value = '';
    grid.rows[4].cells[20].value = '';
    grid.rows[4].cells[21].value = '';
    grid.rows[4].cells[22].value = '';
    grid.rows[4].cells[23].value = '';
    grid.rows[4].cells[24].value = '';
    grid.rows[4].cells[25].value = '';
    grid.rows[4].cells[26].value = '';
    grid.rows[4].cells[27].value = '';
    grid.rows[4].cells[28].value = '';
    grid.rows[4].cells[29].value = '';
    grid.rows[4].cells[30].value = '';
    grid.rows[4].cells[31].value = '';
    grid.rows[4].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[5].cells[0].value = '';
    grid.rows[5].cells[1].value = '';
    grid.rows[5].cells[2].value = '';
    grid.rows[5].cells[3].value = '';
    grid.rows[5].cells[4].value = '';
    grid.rows[5].cells[5].value = '';
    grid.rows[5].cells[6].value = '';
    grid.rows[5].cells[7].value = '';
    grid.rows[5].cells[8].value = '';
    grid.rows[5].cells[9].value = '';
    grid.rows[5].cells[10].value = '';
    grid.rows[5].cells[11].value = '';
    grid.rows[5].cells[12].value = '';
    grid.rows[5].cells[13].value = '';
    grid.rows[5].cells[14].value = '';
    grid.rows[5].cells[15].value = '';
    grid.rows[5].cells[16].value = '';
    grid.rows[5].cells[17].value = '';
    grid.rows[5].cells[18].value = '';
    grid.rows[5].cells[19].value = '';
    grid.rows[5].cells[20].value = '';
    grid.rows[5].cells[21].value = '';
    grid.rows[5].cells[22].value = '';
    grid.rows[5].cells[23].value = '';
    grid.rows[5].cells[24].value = '';
    grid.rows[5].cells[25].value = '';
    grid.rows[5].cells[26].value = '';
    grid.rows[5].cells[27].value = '';
    grid.rows[5].cells[28].value = '';
    grid.rows[5].cells[29].value = '';
    grid.rows[5].cells[30].value = '';
    grid.rows[5].cells[31].value = '';
    grid.rows[5].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[6].cells[0].value = '';
    grid.rows[6].cells[1].value = '';
    grid.rows[6].cells[2].value = '';
    grid.rows[6].cells[3].value = '';
    grid.rows[6].cells[4].value = '';
    grid.rows[6].cells[5].value = '';
    grid.rows[6].cells[6].value = '';
    grid.rows[6].cells[7].value = '';
    grid.rows[6].cells[8].value = '';
    grid.rows[6].cells[9].value = '';
    grid.rows[6].cells[10].value = '';
    grid.rows[6].cells[11].value = '';
    grid.rows[6].cells[12].value = '';
    grid.rows[6].cells[13].value = '';
    grid.rows[6].cells[14].value = '';
    grid.rows[6].cells[15].value = '';
    grid.rows[6].cells[16].value = '';
    grid.rows[6].cells[17].value = '';
    grid.rows[6].cells[18].value = '';
    grid.rows[6].cells[19].value = '';
    grid.rows[6].cells[20].value = '';
    grid.rows[6].cells[21].value = '';
    grid.rows[6].cells[22].value = '';
    grid.rows[6].cells[23].value = '';
    grid.rows[6].cells[24].value = '';
    grid.rows[6].cells[25].value = '';
    grid.rows[6].cells[26].value = '';
    grid.rows[6].cells[27].value = '';
    grid.rows[6].cells[28].value = '';
    grid.rows[6].cells[29].value = '';
    grid.rows[6].cells[30].value = '';
    grid.rows[6].cells[31].value = '';
    grid.rows[6].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[7].cells[0].value = '';
    grid.rows[7].cells[1].value = '';
    grid.rows[7].cells[2].value = '';
    grid.rows[7].cells[3].value = '';
    grid.rows[7].cells[4].value = '';
    grid.rows[7].cells[5].value = '';
    grid.rows[7].cells[6].value = '';
    grid.rows[7].cells[7].value = '';
    grid.rows[7].cells[8].value = '';
    grid.rows[7].cells[9].value = '';
    grid.rows[7].cells[10].value = '';
    grid.rows[7].cells[11].value = '';
    grid.rows[7].cells[12].value = '';
    grid.rows[7].cells[13].value = '';
    grid.rows[7].cells[14].value = '';
    grid.rows[7].cells[15].value = '';
    grid.rows[7].cells[16].value = '';
    grid.rows[7].cells[17].value = '';
    grid.rows[7].cells[18].value = '';
    grid.rows[7].cells[19].value = '';
    grid.rows[7].cells[20].value = '';
    grid.rows[7].cells[21].value = '';
    grid.rows[7].cells[22].value = '';
    grid.rows[7].cells[23].value = '';
    grid.rows[7].cells[24].value = '';
    grid.rows[7].cells[25].value = '';
    grid.rows[7].cells[26].value = '';
    grid.rows[7].cells[27].value = '';
    grid.rows[7].cells[28].value = '';
    grid.rows[7].cells[29].value = '';
    grid.rows[7].cells[30].value = '';
    grid.rows[7].cells[31].value = '';
    grid.rows[7].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[8].cells[0].value = '';
    grid.rows[8].cells[1].value = '';
    grid.rows[8].cells[2].value = '';
    grid.rows[8].cells[3].value = '';
    grid.rows[8].cells[4].value = '';
    grid.rows[8].cells[5].value = '';
    grid.rows[8].cells[6].value = '';
    grid.rows[8].cells[7].value = '';
    grid.rows[8].cells[8].value = '';
    grid.rows[8].cells[9].value = '';
    grid.rows[8].cells[10].value = '';
    grid.rows[8].cells[11].value = '';
    grid.rows[8].cells[12].value = '';
    grid.rows[8].cells[13].value = '';
    grid.rows[8].cells[14].value = '';
    grid.rows[8].cells[15].value = '';
    grid.rows[8].cells[16].value = '';
    grid.rows[8].cells[17].value = '';
    grid.rows[8].cells[18].value = '';
    grid.rows[8].cells[19].value = '';
    grid.rows[8].cells[20].value = '';
    grid.rows[8].cells[21].value = '';
    grid.rows[8].cells[22].value = '';
    grid.rows[8].cells[23].value = '';
    grid.rows[8].cells[24].value = '';
    grid.rows[8].cells[25].value = '';
    grid.rows[8].cells[26].value = '';
    grid.rows[8].cells[27].value = '';
    grid.rows[8].cells[28].value = '';
    grid.rows[8].cells[29].value = '';
    grid.rows[8].cells[30].value = '';
    grid.rows[8].cells[31].value = '';
    grid.rows[8].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[9].cells[0].value = '';
    grid.rows[9].cells[1].value = '';
    grid.rows[9].cells[2].value = '';
    grid.rows[9].cells[3].value = '';
    grid.rows[9].cells[4].value = '';
    grid.rows[9].cells[5].value = '';
    grid.rows[9].cells[6].value = '';
    grid.rows[9].cells[7].value = '';
    grid.rows[9].cells[8].value = '';
    grid.rows[9].cells[9].value = '';
    grid.rows[9].cells[10].value = '';
    grid.rows[9].cells[11].value = '';
    grid.rows[9].cells[12].value = '';
    grid.rows[9].cells[13].value = '';
    grid.rows[9].cells[14].value = '';
    grid.rows[9].cells[15].value = '';
    grid.rows[9].cells[16].value = '';
    grid.rows[9].cells[17].value = '';
    grid.rows[9].cells[18].value = '';
    grid.rows[9].cells[19].value = '';
    grid.rows[9].cells[20].value = '';
    grid.rows[9].cells[21].value = '';
    grid.rows[9].cells[22].value = '';
    grid.rows[9].cells[23].value = '';
    grid.rows[9].cells[24].value = '';
    grid.rows[9].cells[25].value = '';
    grid.rows[9].cells[26].value = '';
    grid.rows[9].cells[27].value = '';
    grid.rows[9].cells[28].value = '';
    grid.rows[9].cells[29].value = '';
    grid.rows[9].cells[30].value = '';
    grid.rows[9].cells[31].value = '';
    grid.rows[9].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[10].cells[0].value = '';
    grid.rows[10].cells[1].value = '';
    grid.rows[10].cells[2].value = '';
    grid.rows[10].cells[3].value = '';
    grid.rows[10].cells[4].value = '';
    grid.rows[10].cells[5].value = '';
    grid.rows[10].cells[6].value = '';
    grid.rows[10].cells[7].value = '';
    grid.rows[10].cells[8].value = '';
    grid.rows[10].cells[9].value = '';
    grid.rows[10].cells[10].value = '';
    grid.rows[10].cells[11].value = '';
    grid.rows[10].cells[12].value = '';
    grid.rows[10].cells[13].value = '';
    grid.rows[10].cells[14].value = '';
    grid.rows[10].cells[15].value = '';
    grid.rows[10].cells[16].value = '';
    grid.rows[10].cells[17].value = '';
    grid.rows[10].cells[18].value = '';
    grid.rows[10].cells[19].value = '';
    grid.rows[10].cells[20].value = '';
    grid.rows[10].cells[21].value = '';
    grid.rows[10].cells[22].value = '';
    grid.rows[10].cells[23].value = '';
    grid.rows[10].cells[24].value = '';
    grid.rows[10].cells[25].value = '';
    grid.rows[10].cells[26].value = '';
    grid.rows[10].cells[27].value = '';
    grid.rows[10].cells[28].value = '';
    grid.rows[10].cells[29].value = '';
    grid.rows[10].cells[30].value = '';
    grid.rows[10].cells[31].value = '';
    grid.rows[10].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[11].cells[0].value = '';
    grid.rows[11].cells[1].value = '';
    grid.rows[11].cells[2].value = '';
    grid.rows[11].cells[3].value = '';
    grid.rows[11].cells[4].value = '';
    grid.rows[11].cells[5].value = '';
    grid.rows[11].cells[6].value = '';
    grid.rows[11].cells[7].value = '';
    grid.rows[11].cells[8].value = '';
    grid.rows[11].cells[9].value = '';
    grid.rows[11].cells[10].value = '';
    grid.rows[11].cells[11].value = '';
    grid.rows[11].cells[12].value = '';
    grid.rows[11].cells[13].value = '';
    grid.rows[11].cells[14].value = '';
    grid.rows[11].cells[15].value = '';
    grid.rows[11].cells[16].value = '';
    grid.rows[11].cells[17].value = '';
    grid.rows[11].cells[18].value = '';
    grid.rows[11].cells[19].value = '';
    grid.rows[11].cells[20].value = '';
    grid.rows[11].cells[21].value = '';
    grid.rows[11].cells[22].value = '';
    grid.rows[11].cells[23].value = '';
    grid.rows[11].cells[24].value = '';
    grid.rows[11].cells[25].value = '';
    grid.rows[11].cells[26].value = '';
    grid.rows[11].cells[27].value = '';
    grid.rows[11].cells[28].value = '';
    grid.rows[11].cells[29].value = '';
    grid.rows[11].cells[30].value = '';
    grid.rows[11].cells[31].value = '';
    grid.rows[11].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[12].cells[0].value = '';
    grid.rows[12].cells[1].value = '';
    grid.rows[12].cells[2].value = '';
    grid.rows[12].cells[3].value = '';
    grid.rows[12].cells[4].value = '';
    grid.rows[12].cells[5].value = '';
    grid.rows[12].cells[6].value = '';
    grid.rows[12].cells[7].value = '';
    grid.rows[12].cells[8].value = '';
    grid.rows[12].cells[9].value = '';
    grid.rows[12].cells[10].value = '';
    grid.rows[12].cells[11].value = '';
    grid.rows[12].cells[12].value = '';
    grid.rows[12].cells[13].value = '';
    grid.rows[12].cells[14].value = '';
    grid.rows[12].cells[15].value = '';
    grid.rows[12].cells[16].value = '';
    grid.rows[12].cells[17].value = '';
    grid.rows[12].cells[18].value = '';
    grid.rows[12].cells[19].value = '';
    grid.rows[12].cells[20].value = '';
    grid.rows[12].cells[21].value = '';
    grid.rows[12].cells[22].value = '';
    grid.rows[12].cells[23].value = '';
    grid.rows[12].cells[24].value = '';
    grid.rows[12].cells[25].value = '';
    grid.rows[12].cells[26].value = '';
    grid.rows[12].cells[27].value = '';
    grid.rows[12].cells[28].value = '';
    grid.rows[12].cells[29].value = '';
    grid.rows[12].cells[30].value = '';
    grid.rows[12].cells[31].value = '';
    grid.rows[12].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[13].cells[0].value = '';
    grid.rows[13].cells[1].value = '';
    grid.rows[13].cells[2].value = '';
    grid.rows[13].cells[3].value = '';
    grid.rows[13].cells[4].value = '';
    grid.rows[13].cells[5].value = '';
    grid.rows[13].cells[6].value = '';
    grid.rows[13].cells[7].value = '';
    grid.rows[13].cells[8].value = '';
    grid.rows[13].cells[9].value = '';
    grid.rows[13].cells[10].value = '';
    grid.rows[13].cells[11].value = '';
    grid.rows[13].cells[12].value = '';
    grid.rows[13].cells[13].value = '';
    grid.rows[13].cells[14].value = '';
    grid.rows[13].cells[15].value = '';
    grid.rows[13].cells[16].value = '';
    grid.rows[13].cells[17].value = '';
    grid.rows[13].cells[18].value = '';
    grid.rows[13].cells[19].value = '';
    grid.rows[13].cells[20].value = '';
    grid.rows[13].cells[21].value = '';
    grid.rows[13].cells[22].value = '';
    grid.rows[13].cells[23].value = '';
    grid.rows[13].cells[24].value = '';
    grid.rows[13].cells[25].value = '';
    grid.rows[13].cells[26].value = '';
    grid.rows[13].cells[27].value = '';
    grid.rows[13].cells[28].value = '';
    grid.rows[13].cells[29].value = '';
    grid.rows[13].cells[30].value = '';
    grid.rows[13].cells[31].value = '';
    grid.rows[13].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[14].cells[0].value = '';
    grid.rows[14].cells[1].value = '';
    grid.rows[14].cells[2].value = '';
    grid.rows[14].cells[3].value = '';
    grid.rows[14].cells[4].value = '';
    grid.rows[14].cells[5].value = '';
    grid.rows[14].cells[6].value = '';
    grid.rows[14].cells[7].value = '';
    grid.rows[14].cells[8].value = '';
    grid.rows[14].cells[9].value = '';
    grid.rows[14].cells[10].value = '';
    grid.rows[14].cells[11].value = '';
    grid.rows[14].cells[12].value = '';
    grid.rows[14].cells[13].value = '';
    grid.rows[14].cells[14].value = '';
    grid.rows[14].cells[15].value = '';
    grid.rows[14].cells[16].value = '';
    grid.rows[14].cells[17].value = '';
    grid.rows[14].cells[18].value = '';
    grid.rows[14].cells[19].value = '';
    grid.rows[14].cells[20].value = '';
    grid.rows[14].cells[21].value = '';
    grid.rows[14].cells[22].value = '';
    grid.rows[14].cells[23].value = '';
    grid.rows[14].cells[24].value = '';
    grid.rows[14].cells[25].value = '';
    grid.rows[14].cells[26].value = '';
    grid.rows[14].cells[27].value = '';
    grid.rows[14].cells[28].value = '';
    grid.rows[14].cells[29].value = '';
    grid.rows[14].cells[30].value = '';
    grid.rows[14].cells[31].value = '';
    grid.rows[14].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[15].cells[0].value = '';
    grid.rows[15].cells[1].value = '';
    grid.rows[15].cells[2].value = '';
    grid.rows[15].cells[3].value = '';
    grid.rows[15].cells[4].value = '';
    grid.rows[15].cells[5].value = '';
    grid.rows[15].cells[6].value = '';
    grid.rows[15].cells[7].value = '';
    grid.rows[15].cells[8].value = '';
    grid.rows[15].cells[9].value = '';
    grid.rows[15].cells[10].value = '';
    grid.rows[15].cells[11].value = '';
    grid.rows[15].cells[12].value = '';
    grid.rows[15].cells[13].value = '';
    grid.rows[15].cells[14].value = '';
    grid.rows[15].cells[15].value = '';
    grid.rows[15].cells[16].value = '';
    grid.rows[15].cells[17].value = '';
    grid.rows[15].cells[18].value = '';
    grid.rows[15].cells[19].value = '';
    grid.rows[15].cells[20].value = '';
    grid.rows[15].cells[21].value = '';
    grid.rows[15].cells[22].value = '';
    grid.rows[15].cells[23].value = '';
    grid.rows[15].cells[24].value = '';
    grid.rows[15].cells[25].value = '';
    grid.rows[15].cells[26].value = '';
    grid.rows[15].cells[27].value = '';
    grid.rows[15].cells[28].value = '';
    grid.rows[15].cells[29].value = '';
    grid.rows[15].cells[30].value = '';
    grid.rows[15].cells[31].value = '';
    grid.rows[15].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[16].cells[0].value = '';
    grid.rows[16].cells[1].value = '';
    grid.rows[16].cells[2].value = '';
    grid.rows[16].cells[3].value = '';
    grid.rows[16].cells[4].value = '';
    grid.rows[16].cells[5].value = '';
    grid.rows[16].cells[6].value = '';
    grid.rows[16].cells[7].value = '';
    grid.rows[16].cells[8].value = '';
    grid.rows[16].cells[9].value = '';
    grid.rows[16].cells[10].value = '';
    grid.rows[16].cells[11].value = '';
    grid.rows[16].cells[12].value = '';
    grid.rows[16].cells[13].value = '';
    grid.rows[16].cells[14].value = '';
    grid.rows[16].cells[15].value = '';
    grid.rows[16].cells[16].value = '';
    grid.rows[16].cells[17].value = '';
    grid.rows[16].cells[18].value = '';
    grid.rows[16].cells[19].value = '';
    grid.rows[16].cells[20].value = '';
    grid.rows[16].cells[21].value = '';
    grid.rows[16].cells[22].value = '';
    grid.rows[16].cells[23].value = '';
    grid.rows[16].cells[24].value = '';
    grid.rows[16].cells[25].value = '';
    grid.rows[16].cells[26].value = '';
    grid.rows[16].cells[27].value = '';
    grid.rows[16].cells[28].value = '';
    grid.rows[16].cells[29].value = '';
    grid.rows[16].cells[30].value = '';
    grid.rows[16].cells[31].value = '';
    grid.rows[16].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[17].cells[0].value = '';
    grid.rows[17].cells[1].value = '';
    grid.rows[17].cells[2].value = '';
    grid.rows[17].cells[3].value = '';
    grid.rows[17].cells[4].value = '';
    grid.rows[17].cells[5].value = '';
    grid.rows[17].cells[6].value = '';
    grid.rows[17].cells[7].value = '';
    grid.rows[17].cells[8].value = '';
    grid.rows[17].cells[9].value = '';
    grid.rows[17].cells[10].value = '';
    grid.rows[17].cells[11].value = '';
    grid.rows[17].cells[12].value = '';
    grid.rows[17].cells[13].value = '';
    grid.rows[17].cells[14].value = '';
    grid.rows[17].cells[15].value = '';
    grid.rows[17].cells[16].value = '';
    grid.rows[17].cells[17].value = '';
    grid.rows[17].cells[18].value = '';
    grid.rows[17].cells[19].value = '';
    grid.rows[17].cells[20].value = '';
    grid.rows[17].cells[21].value = '';
    grid.rows[17].cells[22].value = '';
    grid.rows[17].cells[23].value = '';
    grid.rows[17].cells[24].value = '';
    grid.rows[17].cells[25].value = '';
    grid.rows[17].cells[26].value = '';
    grid.rows[17].cells[27].value = '';
    grid.rows[17].cells[28].value = '';
    grid.rows[17].cells[29].value = '';
    grid.rows[17].cells[30].value = '';
    grid.rows[17].cells[31].value = '';
    grid.rows[17].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[18].cells[0].value = '';
    grid.rows[18].cells[1].value = '';
    grid.rows[18].cells[2].value = '';
    grid.rows[18].cells[3].value = '';
    grid.rows[18].cells[4].value = '';
    grid.rows[18].cells[5].value = '';
    grid.rows[18].cells[6].value = '';
    grid.rows[18].cells[7].value = '';
    grid.rows[18].cells[8].value = '';
    grid.rows[18].cells[9].value = '';
    grid.rows[18].cells[10].value = '';
    grid.rows[18].cells[11].value = '';
    grid.rows[18].cells[12].value = '';
    grid.rows[18].cells[13].value = '';
    grid.rows[18].cells[14].value = '';
    grid.rows[18].cells[15].value = '';
    grid.rows[18].cells[16].value = '';
    grid.rows[18].cells[17].value = '';
    grid.rows[18].cells[18].value = '';
    grid.rows[18].cells[19].value = '';
    grid.rows[18].cells[20].value = '';
    grid.rows[18].cells[21].value = '';
    grid.rows[18].cells[22].value = '';
    grid.rows[18].cells[23].value = '';
    grid.rows[18].cells[24].value = '';
    grid.rows[18].cells[25].value = '';
    grid.rows[18].cells[26].value = '';
    grid.rows[18].cells[27].value = '';
    grid.rows[18].cells[28].value = '';
    grid.rows[18].cells[29].value = '';
    grid.rows[18].cells[30].value = '';
    grid.rows[18].cells[31].value = '';
    grid.rows[18].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[19].cells[0].value = '';
    grid.rows[19].cells[1].value = '';
    grid.rows[19].cells[2].value = '';
    grid.rows[19].cells[3].value = '';
    grid.rows[19].cells[4].value = '';
    grid.rows[19].cells[5].value = '';
    grid.rows[19].cells[6].value = '';
    grid.rows[19].cells[7].value = '';
    grid.rows[19].cells[8].value = '';
    grid.rows[19].cells[9].value = '';
    grid.rows[19].cells[10].value = '';
    grid.rows[19].cells[11].value = '';
    grid.rows[19].cells[12].value = '';
    grid.rows[19].cells[13].value = '';
    grid.rows[19].cells[14].value = '';
    grid.rows[19].cells[15].value = '';
    grid.rows[19].cells[16].value = '';
    grid.rows[19].cells[17].value = '';
    grid.rows[19].cells[18].value = '';
    grid.rows[19].cells[19].value = '';
    grid.rows[19].cells[20].value = '';
    grid.rows[19].cells[21].value = '';
    grid.rows[19].cells[22].value = '';
    grid.rows[19].cells[23].value = '';
    grid.rows[19].cells[24].value = '';
    grid.rows[19].cells[25].value = '';
    grid.rows[19].cells[26].value = '';
    grid.rows[19].cells[27].value = '';
    grid.rows[19].cells[28].value = '';
    grid.rows[19].cells[29].value = '';
    grid.rows[19].cells[30].value = '';
    grid.rows[19].cells[31].value = '';
    grid.rows[19].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[20].cells[0].value = '';
    grid.rows[20].cells[1].value = '';
    grid.rows[20].cells[2].value = '';
    grid.rows[20].cells[3].value = '';
    grid.rows[20].cells[4].value = '';
    grid.rows[20].cells[5].value = '';
    grid.rows[20].cells[6].value = '';
    grid.rows[20].cells[7].value = '';
    grid.rows[20].cells[8].value = '';
    grid.rows[20].cells[9].value = '';
    grid.rows[20].cells[10].value = '';
    grid.rows[20].cells[11].value = '';
    grid.rows[20].cells[12].value = '';
    grid.rows[20].cells[13].value = '';
    grid.rows[20].cells[14].value = '';
    grid.rows[20].cells[15].value = '';
    grid.rows[20].cells[16].value = '';
    grid.rows[20].cells[17].value = '';
    grid.rows[20].cells[18].value = '';
    grid.rows[20].cells[19].value = '';
    grid.rows[20].cells[20].value = '';
    grid.rows[20].cells[21].value = '';
    grid.rows[20].cells[22].value = '';
    grid.rows[20].cells[23].value = '';
    grid.rows[20].cells[24].value = '';
    grid.rows[20].cells[25].value = '';
    grid.rows[20].cells[26].value = '';
    grid.rows[20].cells[27].value = '';
    grid.rows[20].cells[28].value = '';
    grid.rows[20].cells[29].value = '';
    grid.rows[20].cells[30].value = '';
    grid.rows[20].cells[31].value = '';
    grid.rows[20].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[21].cells[0].value = '';
    grid.rows[21].cells[1].value = '';
    grid.rows[21].cells[2].value = '';
    grid.rows[21].cells[3].value = '';
    grid.rows[21].cells[4].value = '';
    grid.rows[21].cells[5].value = '';
    grid.rows[21].cells[6].value = '';
    grid.rows[21].cells[7].value = '';
    grid.rows[21].cells[8].value = '';
    grid.rows[21].cells[9].value = '';
    grid.rows[21].cells[10].value = '';
    grid.rows[21].cells[11].value = '';
    grid.rows[21].cells[12].value = '';
    grid.rows[21].cells[13].value = '';
    grid.rows[21].cells[14].value = '';
    grid.rows[21].cells[15].value = '';
    grid.rows[21].cells[16].value = '';
    grid.rows[21].cells[17].value = '';
    grid.rows[21].cells[18].value = '';
    grid.rows[21].cells[19].value = '';
    grid.rows[21].cells[20].value = '';
    grid.rows[21].cells[21].value = '';
    grid.rows[21].cells[22].value = '';
    grid.rows[21].cells[23].value = '';
    grid.rows[21].cells[24].value = '';
    grid.rows[21].cells[25].value = '';
    grid.rows[21].cells[26].value = '';
    grid.rows[21].cells[27].value = '';
    grid.rows[21].cells[28].value = '';
    grid.rows[21].cells[29].value = '';
    grid.rows[21].cells[30].value = '';
    grid.rows[21].cells[31].value = '';
    grid.rows[21].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[22].cells[0].value = '';
    grid.rows[22].cells[1].value = '';
    grid.rows[22].cells[2].value = '';
    grid.rows[22].cells[3].value = '';
    grid.rows[22].cells[4].value = '';
    grid.rows[22].cells[5].value = '';
    grid.rows[22].cells[6].value = '';
    grid.rows[22].cells[7].value = '';
    grid.rows[22].cells[8].value = '';
    grid.rows[22].cells[9].value = '';
    grid.rows[22].cells[10].value = '';
    grid.rows[22].cells[11].value = '';
    grid.rows[22].cells[12].value = '';
    grid.rows[22].cells[13].value = '';
    grid.rows[22].cells[14].value = '';
    grid.rows[22].cells[15].value = '';
    grid.rows[22].cells[16].value = '';
    grid.rows[22].cells[17].value = '';
    grid.rows[22].cells[18].value = '';
    grid.rows[22].cells[19].value = '';
    grid.rows[22].cells[20].value = '';
    grid.rows[22].cells[21].value = '';
    grid.rows[22].cells[22].value = '';
    grid.rows[22].cells[23].value = '';
    grid.rows[22].cells[24].value = '';
    grid.rows[22].cells[25].value = '';
    grid.rows[22].cells[26].value = '';
    grid.rows[22].cells[27].value = '';
    grid.rows[22].cells[28].value = '';
    grid.rows[22].cells[29].value = '';
    grid.rows[22].cells[30].value = '';
    grid.rows[22].cells[31].value = '';
    grid.rows[22].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[23].cells[0].value = '';
    grid.rows[23].cells[1].value = '';
    grid.rows[23].cells[2].value = '';
    grid.rows[23].cells[3].value = '';
    grid.rows[23].cells[4].value = '';
    grid.rows[23].cells[5].value = '';
    grid.rows[23].cells[6].value = '';
    grid.rows[23].cells[7].value = '';
    grid.rows[23].cells[8].value = '';
    grid.rows[23].cells[9].value = '';
    grid.rows[23].cells[10].value = '';
    grid.rows[23].cells[11].value = '';
    grid.rows[23].cells[12].value = '';
    grid.rows[23].cells[13].value = '';
    grid.rows[23].cells[14].value = '';
    grid.rows[23].cells[15].value = '';
    grid.rows[23].cells[16].value = '';
    grid.rows[23].cells[17].value = '';
    grid.rows[23].cells[18].value = '';
    grid.rows[23].cells[19].value = '';
    grid.rows[23].cells[20].value = '';
    grid.rows[23].cells[21].value = '';
    grid.rows[23].cells[22].value = '';
    grid.rows[23].cells[23].value = '';
    grid.rows[23].cells[24].value = '';
    grid.rows[23].cells[25].value = '';
    grid.rows[23].cells[26].value = '';
    grid.rows[23].cells[27].value = '';
    grid.rows[23].cells[28].value = '';
    grid.rows[23].cells[29].value = '';
    grid.rows[23].cells[30].value = '';
    grid.rows[23].cells[31].value = '';
    grid.rows[23].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[24].cells[0].value = '';
    grid.rows[24].cells[1].value = '';
    grid.rows[24].cells[2].value = '';
    grid.rows[24].cells[3].value = '';
    grid.rows[24].cells[4].value = '';
    grid.rows[24].cells[5].value = '';
    grid.rows[24].cells[6].value = '';
    grid.rows[24].cells[7].value = '';
    grid.rows[24].cells[8].value = '';
    grid.rows[24].cells[9].value = '';
    grid.rows[24].cells[10].value = '';
    grid.rows[24].cells[11].value = '';
    grid.rows[24].cells[12].value = '';
    grid.rows[24].cells[13].value = '';
    grid.rows[24].cells[14].value = '';
    grid.rows[24].cells[15].value = '';
    grid.rows[24].cells[16].value = '';
    grid.rows[24].cells[17].value = '';
    grid.rows[24].cells[18].value = '';
    grid.rows[24].cells[19].value = '';
    grid.rows[24].cells[20].value = '';
    grid.rows[24].cells[21].value = '';
    grid.rows[2].cells[22].value = '';
    grid.rows[24].cells[23].value = '';
    grid.rows[24].cells[24].value = '';
    grid.rows[24].cells[25].value = '';
    grid.rows[24].cells[26].value = '';
    grid.rows[24].cells[27].value = '';
    grid.rows[24].cells[28].value = '';
    grid.rows[24].cells[29].value = '';
    grid.rows[24].cells[30].value = '';
    grid.rows[24].cells[31].value = '';
    grid.rows[24].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[25].cells[0].value = '';
    grid.rows[25].cells[1].value = '';
    grid.rows[25].cells[2].value = '';
    grid.rows[25].cells[3].value = '';
    grid.rows[25].cells[4].value = '';
    grid.rows[25].cells[5].value = '';
    grid.rows[25].cells[6].value = '';
    grid.rows[25].cells[7].value = '';
    grid.rows[25].cells[8].value = '';
    grid.rows[25].cells[9].value = '';
    grid.rows[25].cells[10].value = '';
    grid.rows[25].cells[11].value = '';
    grid.rows[25].cells[12].value = '';
    grid.rows[25].cells[13].value = '';
    grid.rows[25].cells[14].value = '';
    grid.rows[25].cells[15].value = '';
    grid.rows[25].cells[16].value = '';
    grid.rows[25].cells[17].value = '';
    grid.rows[25].cells[18].value = '';
    grid.rows[25].cells[19].value = '';
    grid.rows[25].cells[20].value = '';
    grid.rows[25].cells[21].value = '';
    grid.rows[25].cells[22].value = '';
    grid.rows[25].cells[23].value = '';
    grid.rows[25].cells[24].value = '';
    grid.rows[25].cells[25].value = '';
    grid.rows[25].cells[26].value = '';
    grid.rows[25].cells[27].value = '';
    grid.rows[25].cells[28].value = '';
    grid.rows[25].cells[29].value = '';
    grid.rows[25].cells[30].value = '';
    grid.rows[25].cells[31].value = '';
    grid.rows[25].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[26].cells[0].value = '';
    grid.rows[26].cells[1].value = '';
    grid.rows[26].cells[2].value = '';
    grid.rows[26].cells[3].value = '';
    grid.rows[26].cells[4].value = '';
    grid.rows[26].cells[5].value = '';
    grid.rows[26].cells[6].value = '';
    grid.rows[26].cells[7].value = '';
    grid.rows[26].cells[8].value = '';
    grid.rows[26].cells[9].value = '';
    grid.rows[26].cells[10].value = '';
    grid.rows[26].cells[11].value = '';
    grid.rows[26].cells[12].value = '';
    grid.rows[26].cells[13].value = '';
    grid.rows[26].cells[14].value = '';
    grid.rows[26].cells[15].value = '';
    grid.rows[2].cells[16].value = '';
    grid.rows[26].cells[17].value = '';
    grid.rows[26].cells[18].value = '';
    grid.rows[26].cells[19].value = '';
    grid.rows[20].cells[20].value = '';
    grid.rows[26].cells[21].value = '';
    grid.rows[26].cells[22].value = '';
    grid.rows[26].cells[23].value = '';
    grid.rows[26].cells[24].value = '';
    grid.rows[26].cells[25].value = '';
    grid.rows[26].cells[26].value = '';
    grid.rows[26].cells[27].value = '';
    grid.rows[26].cells[28].value = '';
    grid.rows[26].cells[29].value = '';
    grid.rows[26].cells[30].value = '';
    grid.rows[26].cells[31].value = '';
    grid.rows[26].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[27].cells[0].value = '';
    grid.rows[27].cells[1].value = '';
    grid.rows[27].cells[2].value = '';
    grid.rows[27].cells[3].value = '';
    grid.rows[27].cells[4].value = '';
    grid.rows[27].cells[5].value = '';
    grid.rows[27].cells[6].value = '';
    grid.rows[27].cells[7].value = '';
    grid.rows[27].cells[8].value = '';
    grid.rows[27].cells[9].value = '';
    grid.rows[27].cells[10].value = '';
    grid.rows[27].cells[11].value = '';
    grid.rows[27].cells[12].value = '';
    grid.rows[27].cells[13].value = '';
    grid.rows[27].cells[14].value = '';
    grid.rows[27].cells[15].value = '';
    grid.rows[27].cells[16].value = '';
    grid.rows[27].cells[17].value = '';
    grid.rows[27].cells[18].value = '';
    grid.rows[27].cells[19].value = '';
    grid.rows[27].cells[20].value = '';
    grid.rows[27].cells[21].value = '';
    grid.rows[27].cells[22].value = '';
    grid.rows[27].cells[23].value = '';
    grid.rows[27].cells[24].value = '';
    grid.rows[27].cells[25].value = '';
    grid.rows[27].cells[26].value = '';
    grid.rows[27].cells[27].value = '';
    grid.rows[27].cells[28].value = '';
    grid.rows[27].cells[29].value = '';
    grid.rows[27].cells[30].value = '';
    grid.rows[27].cells[31].value = '';
    grid.rows[27].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[28].cells[0].value = '';
    grid.rows[28].cells[1].value = '';
    grid.rows[28].cells[2].value = '';
    grid.rows[28].cells[3].value = '';
    grid.rows[28].cells[4].value = '';
    grid.rows[28].cells[5].value = '';
    grid.rows[28].cells[6].value = '';
    grid.rows[28].cells[7].value = '';
    grid.rows[28].cells[8].value = '';
    grid.rows[28].cells[9].value = '';
    grid.rows[28].cells[10].value = '';
    grid.rows[28].cells[11].value = '';
    grid.rows[20].cells[12].value = '';
    grid.rows[28].cells[13].value = '';
    grid.rows[28].cells[14].value = '';
    grid.rows[28].cells[15].value = '';
    grid.rows[28].cells[16].value = '';
    grid.rows[28].cells[17].value = '';
    grid.rows[28].cells[18].value = '';
    grid.rows[28].cells[19].value = '';
    grid.rows[28].cells[20].value = '';
    grid.rows[28].cells[21].value = '';
    grid.rows[28].cells[22].value = '';
    grid.rows[28].cells[23].value = '';
    grid.rows[28].cells[24].value = '';
    grid.rows[28].cells[25].value = '';
    grid.rows[28].cells[26].value = '';
    grid.rows[28].cells[27].value = '';
    grid.rows[28].cells[28].value = '';
    grid.rows[28].cells[29].value = '';
    grid.rows[28].cells[30].value = '';
    grid.rows[28].cells[31].value = '';
    grid.rows[28].cells[32].value = '';

    row1 = grid.rows.add();
    grid.rows[29].cells[0].value = '';
    grid.rows[29].cells[1].value = '';
    grid.rows[29].cells[2].value = '';
    grid.rows[29].cells[3].value = '';
    grid.rows[29].cells[4].value = '';
    grid.rows[29].cells[5].value = '';
    grid.rows[29].cells[6].value = '';
    grid.rows[29].cells[7].value = '';
    grid.rows[29].cells[8].value = '';
    grid.rows[29].cells[9].value = '';
    grid.rows[29].cells[10].value = '';
    grid.rows[2].cells[11].value = '';
    grid.rows[29].cells[12].value = '';
    grid.rows[29].cells[13].value = '';
    grid.rows[29].cells[14].value = '';
    grid.rows[29].cells[15].value = '';
    grid.rows[29].cells[16].value = '';
    grid.rows[29].cells[17].value = '';
    grid.rows[29].cells[18].value = '';
    grid.rows[29].cells[19].value = '';
    grid.rows[29].cells[20].value = '';
    grid.rows[29].cells[21].value = '';
    grid.rows[29].cells[22].value = '';
    grid.rows[29].cells[23].value = '';
    grid.rows[29].cells[24].value = '';
    grid.rows[29].cells[25].value = '';
    grid.rows[29].cells[26].value = '';
    grid.rows[29].cells[27].value = '';
    grid.rows[29].cells[28].value = '';
    grid.rows[29].cells[29].value = '';
    grid.rows[29].cells[30].value = '';
    grid.rows[29].cells[31].value = '';
    grid.rows[29].cells[32].value = '';

    //combinacion de celdas de la cabecera
    grid.headers[0].cells[3].columnSpan = 6;
    grid.headers[0].cells[1].columnSpan = 2;
    grid.headers[0].cells[9].columnSpan = 4;
    grid.headers[0].cells[13].columnSpan = 4;
    grid.headers[0].cells[17].columnSpan = 4;
    grid.headers[0].cells[21].columnSpan = 4;
    grid.headers[0].cells[30].columnSpan = 3;

    //Combinacion de celdas de las filas
    //fila 1
    grid.rows[0].cells[1].columnSpan = 2;
    grid.rows[0].cells[3].columnSpan = 6;
    grid.rows[0].cells[30].columnSpan = 3;
    //fila 2
    grid.rows[1].cells[1].columnSpan = 2;
    grid.rows[1].cells[3].columnSpan = 6;
    grid.rows[1].cells[30].columnSpan = 3;
    //fila 3
    grid.rows[2].cells[1].columnSpan = 2;
    grid.rows[2].cells[3].columnSpan = 6;
    grid.rows[2].cells[30].columnSpan = 3;
    //fila 4
    grid.rows[3].cells[1].columnSpan = 2;
    grid.rows[3].cells[3].columnSpan = 6;
    grid.rows[3].cells[30].columnSpan = 3;
    //fila 5
    grid.rows[4].cells[1].columnSpan = 2;
    grid.rows[4].cells[3].columnSpan = 6;
    grid.rows[4].cells[30].columnSpan = 3;
    //fila 6
    grid.rows[5].cells[1].columnSpan = 2;
    grid.rows[5].cells[3].columnSpan = 6;
    grid.rows[5].cells[30].columnSpan = 3;
    //fila 7
    grid.rows[6].cells[1].columnSpan = 2;
    grid.rows[6].cells[3].columnSpan = 6;
    grid.rows[6].cells[30].columnSpan = 3;
    //fila 8
    grid.rows[7].cells[1].columnSpan = 2;
    grid.rows[7].cells[3].columnSpan = 6;
    grid.rows[7].cells[30].columnSpan = 3;
    //fila 9
    grid.rows[8].cells[1].columnSpan = 2;
    grid.rows[8].cells[3].columnSpan = 6;
    grid.rows[8].cells[30].columnSpan = 3;
    //fila 10
    grid.rows[9].cells[1].columnSpan = 2;
    grid.rows[9].cells[3].columnSpan = 6;
    grid.rows[9].cells[30].columnSpan = 3;
    //fila 11
    grid.rows[10].cells[1].columnSpan = 2;
    grid.rows[10].cells[3].columnSpan = 6;
    grid.rows[10].cells[30].columnSpan = 3;
    //fila 12
    grid.rows[11].cells[1].columnSpan = 2;
    grid.rows[11].cells[3].columnSpan = 6;
    grid.rows[11].cells[30].columnSpan = 3;
    //fila 13
    grid.rows[12].cells[1].columnSpan = 2;
    grid.rows[12].cells[3].columnSpan = 6;
    grid.rows[12].cells[30].columnSpan = 3;
    //fila 14
    grid.rows[13].cells[1].columnSpan = 2;
    grid.rows[13].cells[3].columnSpan = 6;
    grid.rows[13].cells[30].columnSpan = 3;
    //fila 15
    grid.rows[14].cells[1].columnSpan = 2;
    grid.rows[14].cells[3].columnSpan = 6;
    grid.rows[14].cells[30].columnSpan = 3;
    //fila 16
    grid.rows[15].cells[1].columnSpan = 2;
    grid.rows[15].cells[3].columnSpan = 6;
    grid.rows[15].cells[30].columnSpan = 3;
    //fila 17
    grid.rows[16].cells[1].columnSpan = 2;
    grid.rows[16].cells[3].columnSpan = 6;
    grid.rows[16].cells[30].columnSpan = 3;
    //fila 18
    grid.rows[17].cells[1].columnSpan = 2;
    grid.rows[17].cells[3].columnSpan = 6;
    grid.rows[17].cells[30].columnSpan = 3;
    //fila 19
    grid.rows[18].cells[1].columnSpan = 2;
    grid.rows[18].cells[3].columnSpan = 6;
    grid.rows[18].cells[30].columnSpan = 3;
    //fila 20
    grid.rows[19].cells[1].columnSpan = 2;
    grid.rows[19].cells[3].columnSpan = 6;
    grid.rows[19].cells[30].columnSpan = 3;
    //fila 21
    grid.rows[20].cells[1].columnSpan = 2;
    grid.rows[20].cells[3].columnSpan = 6;
    grid.rows[20].cells[30].columnSpan = 3;
    //fila 22
    grid.rows[21].cells[1].columnSpan = 2;
    grid.rows[21].cells[3].columnSpan = 6;
    grid.rows[21].cells[30].columnSpan = 3;
    //fila 23
    grid.rows[22].cells[1].columnSpan = 2;
    grid.rows[22].cells[3].columnSpan = 6;
    grid.rows[22].cells[30].columnSpan = 3;
    //fila 24
    grid.rows[23].cells[1].columnSpan = 2;
    grid.rows[23].cells[3].columnSpan = 6;
    grid.rows[23].cells[30].columnSpan = 3;
    //fila 25
    grid.rows[24].cells[1].columnSpan = 2;
    grid.rows[24].cells[3].columnSpan = 6;
    grid.rows[24].cells[30].columnSpan = 3;
    //fila 26
    grid.rows[25].cells[1].columnSpan = 2;
    grid.rows[25].cells[3].columnSpan = 6;
    grid.rows[25].cells[30].columnSpan = 3;
    //fila 27
    grid.rows[26].cells[1].columnSpan = 2;
    grid.rows[26].cells[3].columnSpan = 6;
    grid.rows[26].cells[30].columnSpan = 3;
    //fila 28
    grid.rows[27].cells[1].columnSpan = 2;
    grid.rows[27].cells[3].columnSpan = 6;
    grid.rows[27].cells[30].columnSpan = 3;
    //fila 29
    grid.rows[28].cells[1].columnSpan = 2;
    grid.rows[28].cells[3].columnSpan = 6;
    grid.rows[28].cells[30].columnSpan = 3;
    //fila 30
    grid.rows[29].cells[1].columnSpan = 2;
    grid.rows[29].cells[3].columnSpan = 6;
    grid.rows[29].cells[30].columnSpan = 3;

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