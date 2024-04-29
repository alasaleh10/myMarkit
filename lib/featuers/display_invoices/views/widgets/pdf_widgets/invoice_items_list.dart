import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoicess_items_model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class InvoiceListItems extends StatelessWidget {
  final List<InvoicessItemsModel> items;
  final Font font;

  InvoiceListItems({required this.items, required this.font});

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, int index) {
        return pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: pw.Column(children: [
              pw.Row(children: [
                pw.Expanded(
                    flex: 3,
                    child: pw.Text(items[index].productName!,
                        style: pw.TextStyle(font: font))),
                pw.Expanded(
                    child: pw.Text(items[index].count.toString(),
                        style: pw.TextStyle(font: font))),
                pw.Expanded(
                    child: pw.Text(
                  decimalNumer2(price: items[index].ontPrice!),
                  style: TextStyle(font: font),
                )),
                pw.Expanded(
                    child: Text(
                  decimalNumer2(
                      price: (items[index].count!) * items[index].ontPrice!),
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
