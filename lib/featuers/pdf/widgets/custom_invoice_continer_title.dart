import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class CustomInvoiceTitleContiner extends StatelessWidget {
  final Font font;
  final String title;

  CustomInvoiceTitleContiner({required this.font, required this.title});

  @override
  Widget build(context) {
    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: pw.Container(
            padding: const pw.EdgeInsets.symmetric(vertical: 10),
            child: pw.Text(title, style: pw.TextStyle(font: font))));
  }
}
