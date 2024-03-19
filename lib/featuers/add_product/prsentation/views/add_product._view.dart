import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/add_product/data/add_product_repo_im.dart';
import 'package:my_markit/featuers/add_product/prsentation/view_model/add_product_cuibt/add_product_cubit.dart';
import 'package:my_markit/featuers/add_product/prsentation/widgets/app_product_body_view.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(AddProductRepoIm()),
      child: Scaffold(
        appBar: appBar(context, title: 'إضـافة منــتج'),
        body: const AddProductBodyView(),
      ),
    );
  }
}
