import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';

class EditInvoiceItems extends StatefulWidget {
  final int index;
  final BuildContext context2;
  final InvoiceModel invoiceModel;
  const EditInvoiceItems(
      {super.key,
      required this.context2,
      required this.invoiceModel,
      required this.index});

  @override
  State<EditInvoiceItems> createState() => _EditInvoiceItemsState();
}

class _EditInvoiceItemsState extends State<EditInvoiceItems> {
  @override
  void initState() {
    count.text = widget.invoiceModel.count.toString();

    super.initState();
  }

  var count = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<InvoiceCubit>(widget.context2);
    return AlertDialog(
      icon: Column(
        children: [
          CustomTextFormFiald(
              keyboardType: TextInputType.number,
              controller: count,
              hintText: 'الــكمية',
              icon: FontAwesomeIcons.hashtag),
          Row(
            children: [
              Expanded(
                  child: FittedBox(
                      child: CustomElevatedButton(
                          title: 'إغـلاق',
                          onPressed: () {
                            context.pop();
                          }))),
              const SizedBox(width: 10),
              Expanded(
                  child: FittedBox(
                      child: CustomElevatedButton(
                          title: 'تعديل',
                          onPressed: () {
                            if (count.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar(context,
                                      title: 'لايمكن ترك الكمية فارغا'));
                            } else if (!RegExp('^[0-9]').hasMatch(count.text)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar(context,
                                      title: 'يجب ان يكون رقم'));
                            } else {
                              if (widget.invoiceModel.totalCount <
                                  int.parse(count.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    customSnackBar(context,
                                        title:
                                            'الكمية المتبقية ${widget.invoiceModel.totalCount}'));
                              } else {
                                int newTotal = widget.invoiceModel.onePrice *
                                    int.parse(count.text);

                                int newPrice = (controller.price -
                                        widget.invoiceModel.price) +
                                    newTotal;

                                controller.editPrice(price: newPrice);

                                controller.editProductList(
                                    index: widget.index,
                                    invoiceModel: [
                                      InvoiceModel(
                                          id: widget.invoiceModel.id,
                                          productName:
                                              widget.invoiceModel.productName,
                                          count: int.parse(count.text),
                                          onePrice:
                                              widget.invoiceModel.onePrice,
                                          price: newTotal,
                                          totalCount:
                                              widget.invoiceModel.totalCount)
                                    ]);
                                context.pop();
                              }
                            }
                          }))),
              const SizedBox(width: 10),
              Expanded(
                  child: FittedBox(
                      child: CustomElevatedButton(
                          title: 'حـذف',
                          onPressed: () {
                            controller.deleteItem(
                                index: widget.index,
                                productPrice: widget.invoiceModel.price);
                            context.pop();
                          })))
            ],
          )
        ],
      ),
    );
  }
}
