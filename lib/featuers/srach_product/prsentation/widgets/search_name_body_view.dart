import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/widgets/custom_text_form.dart';
import 'package:my_markit/core/widgets/error_text.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/search_product_cuibt/search_product_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/dispaly_product.dart';

class SearchNameBodyView extends StatelessWidget {
  const SearchNameBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomTextFormFiald(
              onChanged: (value) {
                BlocProvider.of<SearchProductCubit>(context).name = value;
                BlocProvider.of<SearchProductCubit>(context)
                    .searchByBName(name: value!);
              },
              hintText: 'اسـم الصــنف',
              icon: FontAwesomeIcons.productHunt),
        ),
        BlocBuilder<SearchProductCubit, SearchProductState>(
          builder: (context, state) {
            switch (state) {
              case SearchProductFailure():
                return SliverFillRemaining(
                  child: ErrorText(errorMessage: state.errorMessage),
                );

              case SearchProductInitial():
                return const SliverFillRemaining(
                  child: ErrorText(errorMessage: 'قم بإدخال اسم الصنف للبحث'),
                );

              case SearchProductLoading():
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                );
              case SearchProductSucsess():
                return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DisplayProduct(
                        productModel: state.prodcust[index],
                        isBarcode: false,
                      ));
                }, childCount: state.prodcust.length));
            }
          },
        )
      ],
    );
  }
}
