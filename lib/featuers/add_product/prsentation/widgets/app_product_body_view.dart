
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:my_markit/core/functions/custom_snack_bar.dart';

import 'package:my_markit/core/widgets/custom_elevated_button.dart';

import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/add_product/prsentation/view_model/add_product_cuibt/add_product_cubit.dart';
import 'package:my_markit/featuers/add_product/prsentation/widgets/add_finish_product_time.dart';
import 'package:my_markit/featuers/add_product/prsentation/widgets/add_product_barcode.dart';
import 'package:my_markit/featuers/add_product/prsentation/widgets/custom_product_count_drop.dart';
import 'package:my_markit/featuers/add_product/prsentation/widgets/finish_date_time_product.dart';

class AddProductBodyView extends StatelessWidget {
  const AddProductBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<AddProductCubit>(context);
    return Form(
      key: controller.key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            CustomTextFormFiald(
              controller: controller.productName,
              hintText: 'اسـم الـمنتج',
              icon: FontAwesomeIcons.productHunt,
            ),
            CustomTextFormFiald(
              keyboardType: TextInputType.number,
              controller: controller.productPrice,
              hintText: 'سـعر الـمنتج',
              icon: FontAwesomeIcons.moneyCheck,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormFiald(
                      onChanged: (value) {
                        if (value == '' || value == ' ') {
                          controller.counter = 0;
                        } else {
                          controller.counter = int.parse(value ?? '0');
                          controller.count();
                        }
                      },
                      keyboardType: TextInputType.number,
                      hintText: 'الـكميــة',
                      icon: FontAwesomeIcons.hashtag),
                ),
                // const SizedBox(width: 16),
                const Expanded(child: CustomProductCountDrop()),
              ],
            ),
            const Row(
              children: [
                Expanded(child: AddProductBarcode()),
                SizedBox(width: 10),
                Expanded(child: AddFinishProductTime())
              ],
            ),
            const SizedBox(height: 15),
            const FinishDateTimePRoduct(),
            const SizedBox(height: 15),
            BlocListener<AddProductCubit, AddProductState>(
              listener: (context, state) {
                if (state is AddProductFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(context, title: state.errorMessage));
                } else if (state is AddProductSucsess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(context, title: 'تمت الإضافة بنجاح'));
                  controller.productName.clear();
                  controller.productPrice.clear();
                  controller.productBarcode = null;
                }
              },
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomElevatedButton(
                      title: 'إضافة',
                      onPressed: () async {
                      
                        // var a =
                        //     await SqlHeper.readdata('select * from products');
                        // print(a);
                        // print(controller.counter);
                        controller.addProduct();
                      })),
            )
          ],
        ),
      ),
    );
  }
}
