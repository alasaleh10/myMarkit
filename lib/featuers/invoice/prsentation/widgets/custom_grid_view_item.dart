import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/utils/app_styls.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/invoice/prsentation/widgets/product_conut_continer.dart';

class CustomGridViewItem extends StatelessWidget {
  final ProductModel productModel;
  const CustomGridViewItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => ProductCountContiner(
                context2: context, productModel: productModel));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                productModel.productName!,
                style: AppStyle.style20Bold(context),
              ),
              Text('${productModel.productPrice!} ر.ي'),
            ],
          ),
        ),
      ),
    );
  }
}
