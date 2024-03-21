import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';

import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/product_actions_row.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/product_row_detils.dart';

class DisplayProduct extends StatelessWidget {
  final bool isBarcode;
  final ProductModel productModel;

  const DisplayProduct({
    super.key,
    required this.productModel,
    required this.isBarcode,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(productModel.productFinishDate!);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PRoductDetilsRow(
              title: 'اسم الـصنف : ', detils: productModel.productName!),
          const Divider(color: AppColors.kPrimaryColor),
          PRoductDetilsRow(
              title: 'الســعر', detils: '${productModel.productPrice!} ر.ي'),
          const Divider(color: AppColors.kPrimaryColor),
          PRoductDetilsRow(
              title: 'الــكمية', detils: productModel.productCount!),
          const Divider(color: AppColors.kPrimaryColor),
          PRoductDetilsRow(
              title: 'تاريخ الإانتهاء',
              detils: '${date.year}-${date.month}-${date.day}'),
          const Divider(color: AppColors.kPrimaryColor),
          PRoductDetilsRow(
              title: 'رقم الــباركود', detils: productModel.productBarcode!),
          const Divider(color: AppColors.kPrimiryColor3),
          ProductsActionsRow(productModel: productModel, isBarcode: isBarcode),
        ],
      ),
    );
  }
}
