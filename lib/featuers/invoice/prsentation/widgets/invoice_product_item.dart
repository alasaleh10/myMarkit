import 'package:flutter/material.dart';
import 'package:my_markit/core/functions/decimal_numbers.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/edite_invoice_items.dart';

class InvoiceProductItem extends StatelessWidget {
  final int index;
  final InvoiceModel invoiceModel;
  const InvoiceProductItem(
      {super.key, required this.invoiceModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => EditInvoiceItems(
                index: index, context2: context, invoiceModel: invoiceModel));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(invoiceModel.productName,
                  style: AppStyle.style20Bold(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3),
              const SizedBox(height: 10),
              FittedBox(child: Text('الكمية : ${invoiceModel.count}')),
              FittedBox(
                  child: Text(
                      'سعر الوحدة : ${decimalNumer(price: invoiceModel.onePrice)}ر.ي')),
              FittedBox(
                  child: Text(
                      'الاإجمـالي : ${decimalNumer(price: invoiceModel.price)}ر.ي')),
            ],
          ),
        ),
      ),
    );
  }
}
