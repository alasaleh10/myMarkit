import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';

import 'package:my_markit/featuers/srach_product/data/product_action_repo_im.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/product_actions_cuibt/products_actions_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/edite_product_body_view.dart';

class EditProductView extends StatelessWidget {
  final List data;
  // final ProductModel productModel;
  const EditProductView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
        create: (context) => ProductsActionsCubit(ProductActionRepIm())
          ..getData(productModel: data[0]),
        child: Scaffold(
          appBar: appBar(context, title: 'تـعديل المــنتج'),
          body:  EditeProductBodyView(isBarcode: data[1],context2: data[2]),
        ));
  }
}
