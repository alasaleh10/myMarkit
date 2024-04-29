import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:my_markit/featuers/pdf/widgets/pdf_invoice_continer.dart';

import 'package:pdf/widgets.dart';

class Pdf3rdContiner extends StatelessWidget {
  final Font font;
  final List<InvoiceModel> invoice;

  Pdf3rdContiner({required this.invoice, required this.font});

  @override
  Widget build(context) {
    var total = 0;
    for (var index in invoice) {
      total = total + index.count * index.onePrice;
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
