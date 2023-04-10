// ignore_for_file: non_constant_identifier_names
import 'dart:typed_data';
import 'dart:io';
import 'package:portalservidorapp/boasVindas_page.dart';
import 'package:portalservidorapp/buttonmodels/formulariosmodels.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../models/Matricula/drawmatricula.dart';

Uint8List? pdfbytesTemporario;

Future<void> pdfUint8Lis() async {
  PDFView.isloading = false;
  PdfDocument pdfdocumento = PdfDocument();
  final page = pdfdocumento.pages.add();

  page.graphics.drawString(
      'Impressão Matricular', PdfStandardFont(PdfFontFamily.helvetica, 35));

  List<int> Bytes = await pdfdocumento.save();
  Uint8List databytes = Uint8List.fromList(Bytes);
  pdfbytesTemporario = databytes;
  pdfdocumento.dispose();
}

Future<void> pdfCreater() async {
  PdfDocument pdfdocumento = PdfDocument();
  final page = pdfdocumento.pages.add();

  page.graphics.drawString(
      'Impressão Matricular', PdfStandardFont(PdfFontFamily.helvetica, 35));

  List<int> Bytes = await pdfdocumento.save();
  Uint8List databytes = Uint8List.fromList(Bytes);
  pdfbytesTemporario = databytes;
  pdfdocumento.dispose();
  PdfSaver(Bytes, 'matricula_data.pdf');
}

Future<void> PdfUintList() async {}

Future<void> PdfSaver(List<int> Bytes, String FileName) async {
  Directory path = await getApplicationDocumentsDirectory();
  String outputpath = path.path;
  final file = File('$outputpath/$FileName');
  await file.writeAsBytes(Bytes, flush: true);
  OpenFilex.open('$outputpath/$FileName');
}
