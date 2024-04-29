import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfItemsList extends StatelessWidget {
  final Font font;
  final List<InvoiceModel> invoice;

  PdfItemsList({required this.font, required this.invoice});

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: invoice.length,
      itemBuilder: (context, int index) {
        return pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: pw.Column(children: [
              pw.Row(children: [
                pw.Expanded(
                    flex: 3,
                    child: pw.Text(invoice[index].productName,
                        style: pw.TextStyle(font: font))),
                pw.Expanded(
                    child: pw.Text(invoice[index].count.toString(),
                        style: pw.TextStyle(font: font))),
                pw.Expanded(
                    child: pw.Text(
                  decimalNumer2(price: invoice[index].onePrice),
                  style: TextStyle(font: font),
                )),
                pw.Expanded(
                    child: Text(
                  decimalNumer2(
                      price: invoice[index].count * invoice[index].onePrice),
                  style: TextStyle(font: font),
                ))
              ]),
              // SizedBox(height: 10),
              pw.Divider()
            ]));
      },
    );
  }
}
