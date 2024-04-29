import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';

import 'package:my_markit/featuers/pdf/save_pdf.dart';

import 'package:my_markit/featuers/pdf/widgets/pdf_clint_name.dart';
import 'package:my_markit/featuers/pdf/widgets/pdf_scound_continer.dart';
import 'package:my_markit/featuers/pdf/widgets/pdf_top_continer.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

Future<File> createPdf(BuildContext context,
    {required String clintName,
    required int invoicetype,
    required List<InvoiceModel> invoice,
    required int invoiceNumber}) async {
  // var font =
  //     Font.ttf(await rootBundle.load("assets/fonts/Tajawal-Regular.ttf"));
  var font2 = Font.ttf(await rootBundle.load("assets/fonts/Cairo-Regular.ttf"));
  var font = Font.ttf(await rootBundle.load("assets/fonts/MadaniArabic.ttf"));

  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (_) {
        return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  PdfTopContiner(
                      font: font2,
                      invoiceNumber: invoiceNumber,
                      invoicetype: invoicetype),
                  PdfClintNameContiner(
                      font: font2, font2: font, clintName: clintName),
                  pw.SizedBox(height: 10),
                  PdfScoundContiner(font: font2, invoice: invoice),
                ]));
      }));

  return saveDocument(name: '$clintName.pdf', pdf: pdf); // Page
}
