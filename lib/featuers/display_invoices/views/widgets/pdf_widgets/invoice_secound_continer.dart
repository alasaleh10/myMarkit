import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/featuers/display_invoices/data/models/invoicess_items_model.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/pdf_widgets/invoice_3rd_continer.dart';
import 'package:my_markit/featuers/display_invoices/views/widgets/pdf_widgets/invoice_items_list.dart';
import 'package:my_markit/featuers/pdf/widgets/invoice_titlr_row.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class InvoiceSecoundContiner extends StatelessWidget {
  final Font font;
  final List<InvoicessItemsModel> items;

  InvoiceSecoundContiner({required this.font, required this.items});

  @override
  Widget build(context) {
    return pw.Container(
        decoration: pw.BoxDecoration(
            border: pw.Border.all(
                color: const PdfColor.fromInt(AppColors.blackColorPw))),
        child: pw.Column(children: [
          InvoiceTitleRow(font2: font),
          pw.Divider(),
          InvoiceListItems(font: font, items: items),
          pw.SizedBox(height: 10),
          Invoicess3rdContiner(font: font, items: items)
          // Pdf3rdContiner(font: font, invoice: invoice)
        ]));
  }
}
