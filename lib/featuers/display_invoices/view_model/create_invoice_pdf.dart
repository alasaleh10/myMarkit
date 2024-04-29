import 'dart:io';

import 'package:flutter/services.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoicess_items_model.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/pdf_widgets/invoice_clint_continer.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/pdf_widgets/invoice_secound_continer.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/pdf_widgets/invoice_top_continer.dart';
import 'package:my_markit/featuers/pdf/save_pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<File> createInvoicePdf(
    {required List<InvoicessItemsModel> items}) async {
  var font2 = Font.ttf(await rootBundle.load("assets/fonts/Cairo-Regular.ttf"));
  var font = Font.ttf(await rootBundle.load("assets/fonts/MadaniArabic.ttf"));

  final pdf = pw.Document();

  pdf.addPage(pw.Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) {
      return pw.Directionality(
          textDirection: pw.TextDirection.rtl,
          child: pw.Column(children: [
            InvoicePdfTopContiner(
                font: font,
                invoiceNumbder: items[0].invoiceNumber!,
                invoicesType: items[0].invoiceType!),
            InvoiceClintContiner(
                font: font2, font2: font, clintName: items[0].clintName!),
            InvoiceSecoundContiner(font: font, items: items)
          ]));
    },
  ));
  return saveDocument(name: '${items[0].clintName}.pdf', pdf: pdf);
}
