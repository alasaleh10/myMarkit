import 'package:my_markit/core/functions/type_invoice.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class InvoicePdfTopContiner extends StatelessWidget {
  final int invoicesType, invoiceNumbder;
  final Font font;

  InvoicePdfTopContiner(
      {required this.invoicesType,
      required this.invoiceNumbder,
      required this.font});

  @override
  Widget build(context) {
    return pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: pw.BoxDecoration(
            color: const PdfColor.fromInt(AppColors.kPrimiryColor3Pw),
            border: pw.Border.all(
                color: const PdfColor.fromInt(AppColors.blackColorPw))),
        child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                  '   الـتاريخ       ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                  style: pw.TextStyle(font: font)),
              pw.Text('فاتورة بيع ${invoiceType(invoiceType: invoicesType)}',
                  style: pw.TextStyle(font: font)),
              pw.Text(' رقم الفاتورة :  $invoiceNumbder',
                  style: pw.TextStyle(font: font))
            ]));
  }
}
