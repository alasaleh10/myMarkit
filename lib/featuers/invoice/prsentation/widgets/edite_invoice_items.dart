import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';

class EditInvoiceItems extends StatelessWidget {
  final int index;
  final BuildContext context2;
  final InvoiceModel invoiceModel;
  const EditInvoiceItems(
      {super.key,
      required this.context2,
      required this.invoiceModel,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Column(
        children: [
          CustomTextFormFiald(
              controller:
                  TextEditingController(text: invoiceModel.count.toString()),
              hintText: 'الــكمية',
              icon: FontAwesomeIcons.hashtag),
          Row(
            children: [
              Expanded(
                  child: FittedBox(
                      child: CustomElevatedButton(
                          title: 'إغـلاق', onPressed: () {}))),
              const SizedBox(width: 10),
              Expanded(
                  child: FittedBox(
                      child: CustomElevatedButton(
                          title: 'تعديل', onPressed: () {}))),
              const SizedBox(width: 10),
              Expanded(
                  child: FittedBox(
                      child: CustomElevatedButton(
                          title: 'حـذف',
                          onPressed: () {
                            BlocProvider.of<InvoiceCubit>(context2).deleteItem(
                                index: index, productPrice: invoiceModel.price);
                            context.pop();
                          })))
            ],
          )
        ],
      ),
    );
  }
}
