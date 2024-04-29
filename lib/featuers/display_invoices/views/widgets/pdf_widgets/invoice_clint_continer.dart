
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';


class InvoiceClintContiner extends StatelessWidget {
  final Font font,font2;
  final String clintName;

  InvoiceClintContiner({required this.font, required this.font2, required this.clintName});


  @override
  Widget build( context) {
    return  pw.Container(
        padding: const pw.EdgeInsets.symmetric(horizontal: 8),
        decoration: pw.BoxDecoration(
            border: pw.Border.all(
                color: const PdfColor.fromInt(AppColors.blackColorPw))),
        child: pw.Row(children: [
          pw.Text('المطلوب من الأخ', style: pw.TextStyle(font: font)),
          pw.SizedBox(width: 6),
          pw.Expanded(
              child: pw.Container(
                  padding: const pw.EdgeInsets.symmetric(
                      vertical: 6, horizontal: 10),
                  decoration: pw.BoxDecoration(
                      borderRadius: pw.BorderRadius.circular(4),
                      border: pw.Border.all(
                          color:
                              const PdfColor.fromInt(AppColors.blackColorPw))),
                  child: pw.Text(clintName, style: pw.TextStyle(font: font2)))),
          pw.SizedBox(width: 6),
          pw.Text('المحترم', style: pw.TextStyle(font: font))
        ]));
  }
}