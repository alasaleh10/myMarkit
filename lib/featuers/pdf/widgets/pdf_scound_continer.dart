import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';

import 'package:my_markit/featuers/pdf/widgets/invoice_titlr_row.dart';

import 'package:my_markit/featuers/pdf/widgets/pdf_3rd_continer.dart';
import 'package:my_markit/featuers/pdf/widgets/pdf_items_list.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfScoundContiner extends StatelessWidget {
  final Font font;
  final List<InvoiceModel> invoice;

  PdfScoundContiner({required this.font, required this.invoice});

  @override
  Widget build(context) {
    return pw.Container(
        decoration: pw.BoxDecoration(
            border: pw.Border.all(
                color: const PdfColor.fromInt(AppColors.blackColorPw))),
        child: pw.Column(children: [
          InvoiceTitleRow(font2: font),
          pw.Divider(),
          PdfItemsList(font: font, invoice: invoice),
          pw.SizedBox(height: 10),
          Pdf3rdContiner(font: font, invoice: invoice)
        ]));
  }
}
