import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/search_product_cuibt/search_product_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/views/search_by_barcode.dart';
import 'package:my_markit/featuers/srach_product/prsentation/views/search_product_by_name.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/type_search_row.dart';

class SearchPRoducBodytView extends StatelessWidget {
  const SearchPRoducBodytView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<SearchProductCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const TypeSearchRow(),
          SliverFillRemaining(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: const [SearchProductBYBarcode(), SearchProductBYName()],
            ),
          )
        ],
      ),
    );

    //  PageView(
    //   children: [
    //    ,
    //     Expanded(child: SizedBox())
    //   ],
    // );
  }
}
