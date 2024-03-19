import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/featuers/add_product/data/product_model.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/search_product_cuibt/search_product_cubit.dart';

class ProductsActionsRow extends StatelessWidget {
  final bool isBarcode;
  final ProductModel productModel;
  const ProductsActionsRow({
    super.key,
    required this.productModel,
    required this.isBarcode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: CustomElevatedButton(
                  title: 'تــعديل',
                  onPressed: () {
                    GoRouter.of(context).pushNamed(AppRouters.editProductView,
                        extra: [productModel, isBarcode, context]);
                  })),
          const SizedBox(width: 10),
          Expanded(
              child: CustomElevatedButton(
                  title: 'حــذف',
                  onPressed: () {
                    BlocProvider.of<SearchProductCubit>(context).deleteProduct(
                        id: productModel.productId!.toInt(),
                        isBarcode: isBarcode,
                        barcode: productModel.productBarcode!,
                        name:
                            BlocProvider.of<SearchProductCubit>(context).name ??
                                '');
                  })),
        ],
      ),
    );
  }
}
