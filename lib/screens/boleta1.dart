import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'guardarbol.dart';

 void generatePdf() async {
    final pdfDocument = PdfDocument();
    final page = pdfDocument.pages.add();

    final PdfTextElement textElement = PdfTextElement(
      text: 'MINISTERIO DE EDUCACIÓN, CIENCIA Y TECNOLOGIA DE ACREDITACIÓN',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );

    final PdfTextElement textElement2 = PdfTextElement(
      text: 'INSTITUCIONAL DEPARTAMENTO DE REGISTRO ACADEMICO DE C.E',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );

    final PdfTextElement textElement3 = PdfTextElement(
      text: 'ESTO SOLO APLICA PARA ESTUDIANTES DE SEGUNDO AÑO',
      font: PdfStandardFont(PdfFontFamily.helvetica, 12),
    );

    final String text = textElement.text;
    const double fontSize = 12;

    // ignore: unused_local_variable
    final double estimatedTextWidth = text.length * (fontSize / 2);
    // ignore: unused_local_variable
    const double estimatedTextHeight = fontSize * 1.2;

    final double pageWidth = page.getClientSize().width;
    final double pageHeight = page.getClientSize().height;

    final PdfStringFormat format = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    );

    final double textX = pageWidth / 2;
    const double textY1 = 40; // Posición vertical del primer texto
    final double textY2 = textY1 +
        textElement.font
            .measureString(textElement.text, format: format)
            .height +
        10; // Posición vertical del segundo texto

    page.graphics.drawString(
      textElement.text,
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      format: format,
      bounds: Rect.fromCenter(
        center: Offset(textX, textY1),
        width: pageWidth,
        height: pageHeight,
      ),
    );

    page.graphics.drawString(
      textElement2.text,
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      format: format,
      bounds: Rect.fromCenter(
        center: Offset(textX, textY2),
        width: pageWidth,
        height: pageHeight,
      ),
    );

    final grid = PdfGrid();
    // Resto del código de la tabla...
    grid.columns.add(count: 6);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Sede Educativa';
    header.cells[1].value =
        '10073-INSTITUTO NACIONAL "CORNELIO AZENÓN SIERRA"';
    header.cells[2].value = '';
    header.cells[3].value = '';
    header.cells[4].value = '';
    header.cells[5].value = '';

    PdfGridRow row1 = grid.rows.add();
    grid.rows[0].cells[0].value = 'Grado';
    grid.rows[0].cells[1].value = '';
    grid.rows[0].cells[2].value = 'Seccion';
    grid.rows[0].cells[3].value = '';
    grid.rows[0].cells[4].value = 'Año';
    grid.rows[0].cells[5].value = '';

    row1 = grid.rows.add();
    grid.rows[1].cells[0].value = 'Estudiante';
    grid.rows[1].cells[1].value = '';
    grid.rows[1].cells[2].value = '';
    grid.rows[1].cells[3].value = '';
    grid.rows[1].cells[4].value = '';
    grid.rows[1].cells[5].value = '';

    // Combinar celdas en la cabecera
    grid.headers[0].cells[1].columnSpan = 5;
    // Combinar celdas
    grid.rows[1].cells[1].columnSpan = 5;

    
    //centrar texto de la primera tabla 
    final PdfGridCellStyle cellStyle = PdfGridCellStyle();
cellStyle.stringFormat = PdfStringFormat();
cellStyle.stringFormat.alignment = PdfTextAlignment.center;

for (int i = 0; i < grid.headers[0].cells.count; i++) {
  final PdfGridCell cell = grid.headers[0].cells[i];
  cell.style = cellStyle;
}

for (int i = 0; i < grid.rows.count; i++) {
  final PdfGridRow row = grid.rows[i];
  for (int j = 0; j < row.cells.count; j++) {
    final PdfGridCell cell = row.cells[j];
    cell.style = cellStyle;
  }
}

// Establecer la altura de las celdas
const double cellHeight = 15; // Establecer la altura deseada de las celdas

for (int i = 0; i < grid.headers[0].cells.count; i++) {
  final PdfGridCell cell = grid.headers[0].cells[i];
  cell.style.stringFormat.alignment = PdfTextAlignment.center;
}

for (int i = 0; i < grid.rows.count; i++) {
  final PdfGridRow row = grid.rows[i];
  row.height = cellHeight;
  for (int j = 0; j < row.cells.count; j++) {
    final PdfGridCell cell = row.cells[j];
    cell.style.stringFormat.alignment = PdfTextAlignment.center;
  }
}
  // Cambiar el ancho de la primera columna
grid.columns[0].width = 70; // Establecer el ancho deseado de la columna

cellStyle.stringFormat = PdfStringFormat();
cellStyle.stringFormat.alignment = PdfTextAlignment.center;

for (int i = 0; i < grid.headers[0].cells.count; i++) {
  final PdfGridCell cell = grid.headers[0].cells[i];
  cell.style = cellStyle;
}

for (int i = 0; i < grid.rows.count; i++) {
  final PdfGridRow row = grid.rows[i];
  for (int j = 0; j < row.cells.count; j++) {
    final PdfGridCell cell = row.cells[j];
    cell.style = cellStyle;
  }
}

    // Dibujar la primera tabla en la página
    grid.draw(page: page, bounds: const Rect.fromLTWH(50, 90, 450, 170));

    //Crear segunda tabla
    final PdfGrid grid2 = PdfGrid();
    grid2.columns.add(count: 17);
    grid2.headers.add(1);

    PdfGridRow header2 = grid2.headers[0];
    grid2.headers[0].cells[0].value = 'Componentes de plan de estudio';
    grid2.headers[0].cells[1].value = '';
    grid2.headers[0].cells[2].value = '';
    grid2.headers[0].cells[3].value = '';
    grid2.headers[0].cells[4].value = '';
    grid2.headers[0].cells[5].value = 'P1';
    grid2.headers[0].cells[6].value = 'P2';
    grid2.headers[0].cells[7].value = 'P3';
    grid2.headers[0].cells[8].value = 'P4';
    grid2.headers[0].cells[9].value = 'NI';
    grid2.headers[0].cells[10].value = 'PP';
    grid2.headers[0].cells[11].value = 'PPS';
    grid2.headers[0].cells[12].value = 'SPS';
    grid2.headers[0].cells[13].value = 'NF';
    grid2.headers[0].cells[14].value = 'Resultado';
    grid2.headers[0].cells[15].value = '';
    grid2.headers[0].cells[16].value = '';
    

    PdfGridRow rows2 = grid2.rows.add();
    grid2.rows[0].cells[0].value = 'LENGUAJE Y LITERATURA';
    grid2.rows[0].cells[1].value = '';
    grid2.rows[0].cells[2].value = '';
    grid2.rows[0].cells[3].value = '';
    grid2.rows[0].cells[4].value = '';
    grid2.rows[0].cells[5].value = '';
    grid2.rows[0].cells[6].value = '';
    grid2.rows[0].cells[7].value = '';
    grid2.rows[0].cells[8].value = '';
    grid2.rows[0].cells[9].value = '';
    grid2.rows[0].cells[10].value = '';
    grid2.rows[0].cells[11].value = '';
    grid2.rows[0].cells[12].value = '';
    grid2.rows[0].cells[13].value = '';
    grid2.rows[0].cells[14].value = 'REPROBADO';
    grid2.rows[0].cells[15].value = '';
    grid2.rows[0].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[1].cells[0].value = 'MATEMATICA';
    grid2.rows[1].cells[1].value = '';
    grid2.rows[1].cells[2].value = '';
    grid2.rows[1].cells[3].value = '';
    grid2.rows[1].cells[4].value = '';
    grid2.rows[1].cells[5].value = '';
    grid2.rows[1].cells[6].value = '';
    grid2.rows[1].cells[7].value = '';
    grid2.rows[1].cells[8].value = '';
    grid2.rows[1].cells[9].value = '';
    grid2.rows[1].cells[10].value = '';
    grid2.rows[1].cells[11].value = '';
    grid2.rows[1].cells[12].value = '';
    grid2.rows[1].cells[13].value = '';
    grid2.rows[1].cells[14].value = 'APROBADO';
    grid2.rows[1].cells[15].value = '';
    grid2.rows[1].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[2].cells[0].value = 'CIENCIAS NATURALES';
    grid2.rows[2].cells[1].value = '';
    grid2.rows[2].cells[2].value = '';
    grid2.rows[2].cells[3].value = '';
    grid2.rows[2].cells[4].value = '';
    grid2.rows[2].cells[5].value = '';
    grid2.rows[2].cells[6].value = '';
    grid2.rows[2].cells[7].value = '';
    grid2.rows[2].cells[8].value = '';
    grid2.rows[2].cells[9].value = '';
    grid2.rows[2].cells[10].value = '';
    grid2.rows[2].cells[11].value = '';
    grid2.rows[2].cells[12].value = '';
    grid2.rows[2].cells[13].value = '';
    grid2.rows[2].cells[14].value = 'APROBADO';
    grid2.rows[2].cells[15].value = '';
    grid2.rows[2].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[3].cells[0].value = 'ESTUDIOS SOCIALES Y CIVICA';
    grid2.rows[3].cells[1].value = '';
    grid2.rows[3].cells[2].value = '';
    grid2.rows[3].cells[3].value = '';
    grid2.rows[3].cells[4].value = '';
    grid2.rows[3].cells[5].value = '';
    grid2.rows[3].cells[6].value = '';
    grid2.rows[3].cells[7].value = '';
    grid2.rows[3].cells[8].value = '';
    grid2.rows[3].cells[9].value = '';
    grid2.rows[3].cells[10].value = '';
    grid2.rows[3].cells[11].value = '';
    grid2.rows[3].cells[12].value = '';
    grid2.rows[3].cells[13].value = '';
    grid2.rows[3].cells[14].value = 'APROBADO';
    grid2.rows[3].cells[15].value = '';
    grid2.rows[3].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[4].cells[0].value = 'MORAL URBANIDAD Y CIVICA';
    grid2.rows[4].cells[1].value = '';
    grid2.rows[4].cells[2].value = '';
    grid2.rows[4].cells[3].value = '';
    grid2.rows[4].cells[4].value = '';
    grid2.rows[4].cells[5].value = '';
    grid2.rows[4].cells[6].value = '';
    grid2.rows[4].cells[7].value = '';
    grid2.rows[4].cells[8].value = '';
    grid2.rows[4].cells[9].value = '';
    grid2.rows[4].cells[10].value = '';
    grid2.rows[4].cells[11].value = '';
    grid2.rows[4].cells[12].value = '';
    grid2.rows[4].cells[13].value = '';
    grid2.rows[4].cells[14].value = 'APROBADO';
    grid2.rows[4].cells[15].value = '';
    grid2.rows[4].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[5].cells[0].value = 'IDIOMA EXTRANJERO';
    grid2.rows[5].cells[1].value = '';
    grid2.rows[5].cells[2].value = '';
    grid2.rows[5].cells[3].value = '';
    grid2.rows[5].cells[4].value = '';
    grid2.rows[5].cells[5].value = '';
    grid2.rows[5].cells[6].value = '';
    grid2.rows[5].cells[7].value = '';
    grid2.rows[5].cells[8].value = '';
    grid2.rows[5].cells[9].value = '';
    grid2.rows[5].cells[10].value = '';
    grid2.rows[5].cells[11].value = '';
    grid2.rows[5].cells[12].value = '';
    grid2.rows[5].cells[13].value = '';
    grid2.rows[5].cells[14].value = 'APROBADO';
    grid2.rows[5].cells[15].value = '';
    grid2.rows[5].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[6].cells[0].value = 'INFORMATICA';
    grid2.rows[6].cells[1].value = '';
    grid2.rows[6].cells[2].value = '';
    grid2.rows[6].cells[3].value = '';
    grid2.rows[6].cells[4].value = '';
    grid2.rows[6].cells[5].value = '';
    grid2.rows[6].cells[6].value = '';
    grid2.rows[6].cells[7].value = '';
    grid2.rows[6].cells[8].value = '';
    grid2.rows[6].cells[9].value = '';
    grid2.rows[6].cells[10].value = '';
    grid2.rows[6].cells[11].value = '';
    grid2.rows[6].cells[12].value = '';
    grid2.rows[6].cells[13].value = '';
    grid2.rows[6].cells[14].value = 'APROBADO';
    grid2.rows[6].cells[15].value = '';
    grid2.rows[6].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[7].cells[0].value = 'ORIENTACION PARA LA VIDA';
    grid2.rows[7].cells[1].value = '';
    grid2.rows[7].cells[2].value = '';
    grid2.rows[7].cells[3].value = '';
    grid2.rows[7].cells[4].value = '';
    grid2.rows[7].cells[5].value = '';
    grid2.rows[7].cells[6].value = '';
    grid2.rows[7].cells[7].value = '';
    grid2.rows[7].cells[8].value = '';
    grid2.rows[7].cells[9].value = '';
    grid2.rows[7].cells[10].value = '';
    grid2.rows[7].cells[11].value = '';
    grid2.rows[7].cells[12].value = '';
    grid2.rows[7].cells[13].value = '';
    grid2.rows[7].cells[14].value = 'APROBADO';
    grid2.rows[7].cells[15].value = '';
    grid2.rows[7].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[8].cells[0].value = 'SEMINARIOS';
    grid2.rows[8].cells[1].value = '';
    grid2.rows[8].cells[2].value = '';
    grid2.rows[8].cells[3].value = '';
    grid2.rows[8].cells[4].value = '';
    grid2.rows[8].cells[5].value = '';
    grid2.rows[8].cells[6].value = '';
    grid2.rows[8].cells[7].value = '';
    grid2.rows[8].cells[8].value = '';
    grid2.rows[8].cells[9].value = '';
    grid2.rows[8].cells[10].value = '';
    grid2.rows[8].cells[11].value = '';
    grid2.rows[8].cells[12].value = '';
    grid2.rows[8].cells[13].value = '';
    grid2.rows[8].cells[14].value = 'APROBADO';
    grid2.rows[8].cells[15].value = '';
    grid2.rows[8].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[9].cells[0].value = 'CURSO DE HABILITACION LABORAL';
    grid2.rows[9].cells[1].value = '';
    grid2.rows[9].cells[2].value = '';
    grid2.rows[9].cells[3].value = '';
    grid2.rows[9].cells[4].value = '';
    grid2.rows[9].cells[5].value = '';
    grid2.rows[9].cells[6].value = '';
    grid2.rows[9].cells[7].value = '';
    grid2.rows[9].cells[8].value = '';
    grid2.rows[9].cells[9].value = '';
    grid2.rows[9].cells[10].value = '';
    grid2.rows[9].cells[11].value = '';
    grid2.rows[9].cells[12].value = '';
    grid2.rows[9].cells[13].value = '';
    grid2.rows[9].cells[14].value = 'APROBADO';
    grid2.rows[9].cells[15].value = '';
    grid2.rows[9].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[10].cells[0].value =
        'EVIDENCIA ACTITUDES FAVORABLES PARA LA CONVIVENCIA Y CULTURA DE PAZ';
    grid2.rows[10].cells[1].value = '';
    grid2.rows[10].cells[2].value = '';
    grid2.rows[10].cells[3].value = '';
    grid2.rows[10].cells[4].value = '';
    grid2.rows[10].cells[5].value = '';
    grid2.rows[10].cells[6].value = '';
    grid2.rows[10].cells[7].value = '';
    grid2.rows[10].cells[8].value = '';
    grid2.rows[10].cells[9].value = '';
    grid2.rows[10].cells[10].value = '';
    grid2.rows[10].cells[11].value = '';
    grid2.rows[10].cells[12].value = '';
    grid2.rows[10].cells[13].value = '';
    grid2.rows[10].cells[14].value = 'APROBADO';
    grid2.rows[10].cells[15].value = '';
    grid2.rows[10].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[11].cells[0].value =
        'TOMA DESICIONES DE FORMA AUTONOMA Y RESPONSABLE';
    grid2.rows[11].cells[1].value = '';
    grid2.rows[11].cells[2].value = '';
    grid2.rows[11].cells[3].value = '';
    grid2.rows[11].cells[4].value = '';
    grid2.rows[11].cells[5].value = '';
    grid2.rows[11].cells[6].value = '';
    grid2.rows[11].cells[7].value = '';
    grid2.rows[11].cells[8].value = '';
    grid2.rows[11].cells[9].value = '';
    grid2.rows[11].cells[10].value = '';
    grid2.rows[11].cells[11].value = '';
    grid2.rows[11].cells[12].value = '';
    grid2.rows[11].cells[13].value = '';
    grid2.rows[11].cells[14].value = 'APROBADO';
    grid2.rows[11].cells[15].value = '';
    grid2.rows[11].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[12].cells[0].value = 'SE EXPRESA Y PARTICIPA CON RESPETO';
    grid2.rows[12].cells[1].value = '';
    grid2.rows[12].cells[2].value = '';
    grid2.rows[12].cells[3].value = '';
    grid2.rows[12].cells[4].value = '';
    grid2.rows[12].cells[5].value = '';
    grid2.rows[12].cells[6].value = '';
    grid2.rows[12].cells[7].value = '';
    grid2.rows[12].cells[8].value = '';
    grid2.rows[12].cells[9].value = '';
    grid2.rows[12].cells[10].value = '';
    grid2.rows[12].cells[11].value = '';
    grid2.rows[12].cells[12].value = '';
    grid2.rows[12].cells[13].value = '';
    grid2.rows[12].cells[14].value = 'APROBADO';
    grid2.rows[12].cells[15].value = '';
    grid2.rows[12].cells[16].value = '';
    grid2.rows.add();
    grid2.rows[13].cells[0].value =
        'MUESTRA SENTIDO DE REFENRENCIA Y RESPETO POR NUESTRA CULTURA';
    grid2.rows[13].cells[1].value = '';
    grid2.rows[13].cells[2].value = '';
    grid2.rows[13].cells[3].value = '';
    grid2.rows[13].cells[4].value = '';
    grid2.rows[13].cells[5].value = '';
    grid2.rows[13].cells[6].value = '';
    grid2.rows[13].cells[7].value = '';
    grid2.rows[13].cells[8].value = '';
    grid2.rows[13].cells[9].value = '';
    grid2.rows[13].cells[10].value = '';
    grid2.rows[13].cells[11].value = '';
    grid2.rows[13].cells[12].value = '';
    grid2.rows[13].cells[13].value = '';
    grid2.rows[13].cells[14].value = 'APROBADO';
    grid2.rows[13].cells[15].value = '';
    grid2.rows[13].cells[16].value = '';


    // Combina las celdas de la segunda tabla
    //Primera fila
    grid2.rows[0].cells[0].columnSpan = 5;
    grid2.rows[0].cells[14].columnSpan = 3;
    //Segunda fila
    grid2.rows[1].cells[0].columnSpan = 5;
    grid2.rows[1].cells[14].columnSpan = 3;
    //tercera fila
    grid2.rows[2].cells[0].columnSpan = 5;
    grid2.rows[2].cells[14].columnSpan = 3;
    //cuarta fila
    grid2.rows[3].cells[0].columnSpan = 5;
    grid2.rows[3].cells[14].columnSpan = 3;
    //quinta fila
    grid2.rows[4].cells[0].columnSpan = 5;
    grid2.rows[4].cells[14].columnSpan = 3;
    //Sexta fila
    grid2.rows[5].cells[0].columnSpan = 5;
    grid2.rows[5].cells[14].columnSpan = 3;
    //Septima fila
    grid2.rows[6].cells[0].columnSpan = 5;
    grid2.rows[6].cells[14].columnSpan = 3;
    //Octava fila
    grid2.rows[7].cells[0].columnSpan = 5;
    grid2.rows[7].cells[14].columnSpan = 3;
    //Novena fila
    grid2.rows[8].cells[0].columnSpan = 5;
    grid2.rows[8].cells[14].columnSpan = 3;
    //Decima fila
    grid2.rows[9].cells[0].columnSpan = 5;
    grid2.rows[9].cells[14].columnSpan = 3;
    //Onceava fila
    grid2.rows[10].cells[0].columnSpan = 5;
    grid2.rows[10].cells[14].columnSpan = 3;
    //Doceava fila
    grid2.rows[11].cells[0].columnSpan = 5;
    grid2.rows[11].cells[14].columnSpan = 3;
    //treceava fila
    grid2.rows[12].cells[0].columnSpan = 5;
    grid2.rows[12].cells[14].columnSpan = 3;
    //catorceava celda
    grid2.rows[13].cells[0].columnSpan = 5;
    grid2.rows[13].cells[14].columnSpan = 3;
    // Combinar celdas en la cabecera
    grid2.headers[0].cells[0].columnSpan = 5;
    grid2.headers[0].cells[14].columnSpan = 3;

    
    // Establecer el color de fondo de las celdas de la cabecera
final PdfColor grayColor = PdfColor(128, 128, 128); // Color gris

grid2.headers[0].cells[0].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[5].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[6].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[7].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[8].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[9].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[10].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[11].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[12].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[13].style.backgroundBrush = PdfSolidBrush(grayColor);
grid2.headers[0].cells[14].style.backgroundBrush = PdfSolidBrush(grayColor);

        // Establecer el color de fondo de las celdas de las filas
for (int i = 0; i < grid2.rows.count; i++) {
  final PdfGridRow row = grid2.rows[i];
  for (int j = 0; j < row.cells.count; j++) {
    final PdfGridCell cell = row.cells[j];
    if (j == 0 || j == 14) {
      cell.style.backgroundBrush = PdfSolidBrush(grayColor);
    }
  }
}

// Restablecer el color de fondo en las celdas combinadas de las otras filas
for (int i = 0; i < grid2.rows.count; i++) {
  for (int j = 0; j < grid2.rows[i].cells.count; j++) {
    grid2.rows[i].cells[j].style.backgroundBrush = PdfSolidBrush(PdfColor.empty);
  }
}

        // Establecer el formato de alineación del texto
final PdfStringFormat headerFormat = PdfStringFormat(
  alignment: PdfTextAlignment.center,
  lineAlignment: PdfVerticalAlignment.middle,
);

  // Establecer el formato de alineación del texto
// Establecer el formato de alineación del texto
final PdfStringFormat headerFormat2 = PdfStringFormat(
  alignment: PdfTextAlignment.center,
  lineAlignment: PdfVerticalAlignment.middle,
);

// Aplicar el formato de alineación del texto a las celdas de la cabecera
for (int i = 0; i < grid2.headers[0].cells.count; i++) {
  final PdfGridCell cell = grid2.headers[0].cells[i];
  cell.style.stringFormat = headerFormat;
}

// Aplicar el formato de alineación del texto a las celdas de las filas
for (int i = 0; i < grid2.rows.count; i++) {
  final PdfGridRow row = grid2.rows[i];
  for (int j = 0; j < row.cells.count; j++) {
    final PdfGridCell cell = row.cells[j];
    cell.style.stringFormat = headerFormat;
  }
}

  
    //Dibujar la segunda tabla
    grid2.draw(page: page, bounds: const Rect.fromLTWH(50, 150, 450, 460));

    final PdfLayoutResult textLayoutResult3 =
        textElement3.draw(page: page, bounds: Rect.fromLTWH(50, 480, 500, 50));

    //Crear tercera tabla
    final PdfGrid grid3 = PdfGrid();
    grid3.columns.add(count: 8);
    grid3.headers.add(1);

    PdfGridRow header3 = grid3.headers[0];
    grid3.headers[0].cells[0].value = 'Componentes de plan de estudio';
    grid3.headers[0].cells[1].value = '';
    grid3.headers[0].cells[2].value = '';
    grid3.headers[0].cells[3].value = '';
    grid3.headers[0].cells[4].value = 'NF';
    grid3.headers[0].cells[5].value = 'Resultado';
    grid3.headers[0].cells[6].value = '';
    grid3.headers[0].cells[7].value = '';

    PdfGridRow rows3 = grid3.rows.add();
    grid3.rows[0].cells[0].value = 'LENGUAJE Y LITERATURA PRUEBA AVANZO';
    grid3.rows[0].cells[1].value = '';
    grid3.rows[0].cells[2].value = '';
    grid3.rows[0].cells[3].value = '';
    grid3.rows[0].cells[4].value = '';
    grid3.rows[0].cells[5].value = '';
    grid3.rows[0].cells[6].value = '';
    grid3.rows[0].cells[7].value = '';
    grid3.rows.add();
    grid3.rows[1].cells[0].value = 'CiENCIAS NATURALES PRUEBA AVANZO';
    grid3.rows[1].cells[1].value = '';
    grid3.rows[1].cells[2].value = '';
    grid3.rows[1].cells[3].value = '';
    grid3.rows[1].cells[4].value = '';
    grid3.rows[1].cells[5].value = '';
    grid3.rows[1].cells[6].value = '';
    grid3.rows[1].cells[7].value = '';
    grid3.rows.add();
    grid3.rows[2].cells[0].value = 'ESTUDIOS SOCIALES Y CIVICA PRUEBA AVANZO';
    grid3.rows[2].cells[1].value = '';
    grid3.rows[2].cells[2].value = '';
    grid3.rows[2].cells[3].value = '';
    grid3.rows[2].cells[4].value = '';
    grid3.rows[2].cells[5].value = '';
    grid3.rows[2].cells[6].value = '';
    grid3.rows[2].cells[7].value = '';
    grid3.rows.add();
    grid3.rows[3].cells[0].value = 'MATEMATICA PRUEBA AVANZO';
    grid3.rows[3].cells[1].value = '';
    grid3.rows[3].cells[2].value = '';
    grid3.rows[3].cells[3].value = '';
    grid3.rows[3].cells[4].value = '';
    grid3.rows[3].cells[5].value = '';
    grid3.rows[3].cells[6].value = '';
    grid3.rows[3].cells[7].value = '';

    //Combinar las celdas de la tabla
    //primera fila
    grid3.rows[0].cells[0].columnSpan = 4;
    grid3.rows[0].cells[5].columnSpan = 3;
    //segunda fila
    grid3.rows[1].cells[0].columnSpan = 4;
    grid3.rows[1].cells[5].columnSpan = 3;
    //tercera fila
    grid3.rows[2].cells[0].columnSpan = 4;
    grid3.rows[2].cells[5].columnSpan = 3;
    //cuarta fila
    grid3.rows[3].cells[0].columnSpan = 4;
    grid3.rows[3].cells[5].columnSpan = 3;

    // Combinar celdas en la cabecera
    grid3.headers[0].cells[0].columnSpan = 4;
    grid3.headers[0].cells[5].columnSpan = 3;

    // Establecer el color de fondo de las celdas de la cabecera
    final PdfColor grayColor1 = PdfColor(128, 128, 128); // Color gris
    grid3.headers[0].cells[0].style.backgroundBrush = PdfSolidBrush(grayColor1);
    grid3.headers[0].cells[4].style.backgroundBrush = PdfSolidBrush(grayColor1);
    grid3.headers[0].cells[5].style.backgroundBrush = PdfSolidBrush(grayColor1);

    // Establecer el color de fondo de las celdas de las filas
for (int i = 0; i < grid3.rows.count; i++) {
  final PdfGridRow row = grid3.rows[i];
  for (int j = 0; j < row.cells.count; j++) {
    final PdfGridCell cell = row.cells[j];
    if (j == 0 || j == 14) {
      cell.style.backgroundBrush = PdfSolidBrush(grayColor1);
    }
  }
}

// Restablecer el color de fondo en las celdas combinadas de las otras filas
for (int i = 0; i < grid3.rows.count; i++) {
  for (int j = 0; j < grid3.rows[i].cells.count; j++) {
    grid3.rows[i].cells[j].style.backgroundBrush = PdfSolidBrush(PdfColor.empty);
  }
}
  // Establecer el formato de alineación del texto
// Establecer el formato de alineación del texto
final PdfStringFormat headerFormat3 = PdfStringFormat(
  alignment: PdfTextAlignment.center,
  lineAlignment: PdfVerticalAlignment.middle,
);

// Aplicar el formato de alineación del texto a las celdas de la cabecera
for (int i = 0; i < grid3.headers[0].cells.count; i++) {
  final PdfGridCell cell = grid3.headers[0].cells[i];
  cell.style.stringFormat = headerFormat;
}

// Aplicar el formato de alineación del texto a las celdas de las filas
for (int i = 0; i < grid3.rows.count; i++) {
  final PdfGridRow row = grid3.rows[i];
  for (int j = 0; j < row.cells.count; j++) {
    final PdfGridCell cell = row.cells[j];
    cell.style.stringFormat = headerFormat;
  }
}

    //Dibujar tercera tabla
    grid3.draw(page: page, bounds: const Rect.fromLTWH(50, 510, 450, 720));

    final bytes = await pdfDocument.save();
    pdfDocument.dispose();

    saveLaunchFile(bytes, 'Boleta de notas.pdf');
  }
