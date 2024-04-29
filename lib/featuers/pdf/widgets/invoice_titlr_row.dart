import 'package:my_markit/featuers/pdf/widgets/custom_invoice_continer_title.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class InvoiceTitleRow extends StatelessWidget {
  final Font font2;

  InvoiceTitleRow({required this.font2});

  @override
  Widget build(context) {
    return pw.Row(children: [
      pw.Expanded(
          flex: 3,
          child: CustomInvoiceTitleContiner(font: font2, title: 'التفاصيل')),
      pw.Expanded(
          child: CustomInvoiceTitleContiner(font: font2, title: 'العدد')),
      pw.Expanded(
          child: CustomInvoiceTitleContiner(font: font2, title: 'سعر الوحدة')),
      pw.Expanded(
          child: CustomInvoiceTitleContiner(font: font2, title: 'الإجمالي'))
    ]);
  }
}
