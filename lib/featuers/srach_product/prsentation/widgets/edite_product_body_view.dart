import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/custom_snack_bar.dart';
import 'package:my_markit/core/utils/app_fonts.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/custom_loading.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/product_actions_cuibt/products_actions_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/search_product_cuibt/search_product_cubit.dart';

class EditeProductBodyView extends StatelessWidget {
  final bool isBarcode;
  final BuildContext context2;
  const EditeProductBodyView(
      {super.key, required this.isBarcode, required this.context2});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsActionsCubit, ProductsActionsState>(
      builder: (context, state) {
        final controller = BlocProvider.of<ProductsActionsCubit>(context);
        if (state is ProductsActionsLoading) {
          return const CustomLoading();
        } else {
          return Form(
            key: controller.key,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: ListView(
                children: [
                  CustomTextFormFiald(
                    hintText: 'اسـم الصنف',
                    icon: FontAwesomeIcons.productHunt,
                    controller: controller.name,
                  ),
                  CustomTextFormFiald(
                    keyboardType: TextInputType.number,
                    hintText: 'الـسعر',
                    icon: FontAwesomeIcons.moneyCheck,
                    controller: controller.price,
                  ),
                  CustomTextFormFiald(
                    keyboardType: TextInputType.number,
                    hintText: 'الكـمية',
                    icon: FontAwesomeIcons.hashtag,
                    controller: controller.count,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'تاريخ الإنتهاء : ${controller.date!.year}-${controller.date!.month}-${controller.date!.day}',
                          style: AppStyle.style20Bold(context)
                              .copyWith(fontFamily: AppFonts.twailtFont),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: CustomElevatedButton(
                        title: 'تــعديل الــتاريخ',
                        onPressed: () async {
                          var res = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2060));
                          controller.changeDate(date: res ?? controller.date!);
                        },
                      ))
                    ],
                  ),
                  const SizedBox(height: 20),
                  BlocListener<ProductsActionsCubit, ProductsActionsState>(
                    listener: (context, state) {
                      if (state is ProductsActionsSucsess2) {
                        if (isBarcode) {
                          BlocProvider.of<SearchProductCubit>(context2)
                              .searchByBarcode(barcode: controller.barcode!);
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(context,
                                  title: 'تم الـعديل بنجاح'));
                          context.pop();
                        } else {
                          BlocProvider.of<SearchProductCubit>(context2)
                              .searchByBName(name: controller.name.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(context,
                                  title: 'تم الـعديل بنجاح'));
                          context.pop();
                        }
                      } else if (state is ProductsActionsFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(context, title: state.errorMessage));
                      }
                    },
                    child: CustomElevatedButton(
                        title: 'تــعديل',
                        onPressed: () {
                          controller.editeProduct();
                        }),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
