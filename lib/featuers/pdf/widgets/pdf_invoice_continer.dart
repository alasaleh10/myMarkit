import 'package:my_markit/core/utils/app_colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceContiner extends StatelessWidget {
  final Widget widget;
  final double? vertical, horizontal;

  PdfInvoiceContiner({this.vertical, this.horizontal, required this.widget});

  @override
  Widget build(context) {
    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: pw.Container(
            padding: pw.EdgeInsets.symmetric(
                vertical: vertical ?? 0, horizontal: horizontal ?? 0),
            decoration: pw.BoxDecoration(
                borderRadius: pw.BorderRadius.circular(6),
                border: pw.Border.all(
                    color: const PdfColor.fromInt(AppColors.blackColorPw))),
            child: widget));
  }
}
