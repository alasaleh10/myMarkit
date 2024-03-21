import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/invoice/data/invoice_model.dart';
import 'package:my_markit/featuers/invoice/prsentation/manger/invoice_cubit/invoice_cubit.dart';

class ProductCountContiner extends StatelessWidget {
  final BuildContext context2;
  final ProductModel productModel;
  const ProductCountContiner(
      {super.key, required this.productModel, required this.context2});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<InvoiceCubit>(context2);
    return AlertDialog.adaptive(
      icon: Column(
        children: [
          CustomTextFormFiald(
              keyboardType: TextInputType.number,
              controller: controller.productCount,
              hintText: 'إختيار الكمية',
              icon: FontAwesomeIcons.confluence),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                  child: CustomElevatedButton(
                title: 'إغــلاق',
                onPressed: () {
                  context.pop();
                },
              )),
              const SizedBox(width: 10),
              Expanded(
                  child: CustomElevatedButton(
                      title: 'تــأكيد',
                      onPressed: () {
                        if (controller.productCount.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(context,
                                  title: 'لايمكن ترك الكمية فارغا'));
                        } else if (!RegExp('^[0-9]')
                            .hasMatch(controller.productCount.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(context,
                                  title: 'يجب ان يكون رقم'));
                        } else {
                          if (int.parse(BlocProvider.of<InvoiceCubit>(context2)
                                  .productCount
                                  .text) >
                              int.parse(productModel.productCount!)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(context,
                                    title:
                                        'الكمية المتبقية ${productModel.productCount}'));
                          } else {
                            int oldPrice = controller.price;
                            int count = int.parse(controller.productCount.text);
                            int price = int.parse(productModel.productPrice!);

                            controller.editPrice(
                                price: oldPrice + (price * count));
                            InvoiceModel invoiceModel = InvoiceModel(
                                id: productModel.productId!.toInt(),
                                count: count,
                                price: (price * count),
                                totalCount:
                                    int.parse(productModel.productCount!),
                                productName: productModel.productName!,
                                onePrice:
                                    int.parse(productModel.productPrice!));
                            controller.addToInvoice(invoiceModel: invoiceModel);

                            context.pop();
                          }
                        }
                      }))
            ],
          )
        ],
      ),
    );
  }
}
