import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/search_product_cuibt/search_product_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/type_search_continer.dart';

class TypeSearchRow extends StatelessWidget {
  const TypeSearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TypeSearchContiner(
                  isActive:
                      BlocProvider.of<SearchProductCubit>(context).pageIndex ==
                              0
                          ? true
                          : false,
                  title: 'بحث بالباركود',
                  onTap: () {
                    BlocProvider.of<SearchProductCubit>(context)
                        .changePage(index: 0);
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TypeSearchContiner(
                  isActive:
                      BlocProvider.of<SearchProductCubit>(context).pageIndex ==
                              1
                          ? true
                          : false,
                  title: 'بحث بالإسم',
                  onTap: () {
                    BlocProvider.of<SearchProductCubit>(context)
                        .changePage(index: 1);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
