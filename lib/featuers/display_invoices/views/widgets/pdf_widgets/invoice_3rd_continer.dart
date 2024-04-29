
import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoicess_items_model.dart';
import 'package:my_markit/featuers/pdf/widgets/pdf_invoice_continer.dart';
import 'package:pdf/widgets.dart';
class Invoicess3rdContiner extends StatelessWidget {
  final List<InvoicessItemsModel> items;
final Font font;

  Invoicess3rdContiner({required this.items, required this.font});
  // Invoicess3rdContiner({required this.items});
  // const Invoicess3rdContiner({super.key});/

  @override
  Widget build( context) {
       var total = 0;
    for (var index in items) {
      total = total + index.count! * index.ontPrice!;
    }
    return Row(children: [
      Expanded(
          flex: 3,
          child: PdfInvoiceContiner(
              vertical: 15,
              horizontal: 10,
              widget: Center(
                  child: Row(children: [
                Text('الإجــمالي : ', style: TextStyle(font: font)),
                Text((convertToArabicNumber(price: total)),
                    style: TextStyle(font: font),
                    textDirection: TextDirection.rtl)
              ])))),
      Expanded(
          child: PdfInvoiceContiner(
              vertical: 15,
              widget: Center(child: Text(decimalNumer2(price: total)))))
    ]);
  }
}