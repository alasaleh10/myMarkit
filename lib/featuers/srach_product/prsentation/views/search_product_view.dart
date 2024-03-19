import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/core/utils/markting_app_bar.dart';
import 'package:my_markit/featuers/srach_product/data/search_product_repo_im.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/search_product_cuibt/search_product_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/search_product_body_view.dart';

class SearchPRoductView extends StatelessWidget {
  const SearchPRoductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchProductCubit(SearchProductRepoIm()),
      child: Scaffold(
        appBar: appBar(context, title: 'بحـث عن مــنتج'),
        body: const SearchPRoducBodytView(),
      ),
    );
  }
}
