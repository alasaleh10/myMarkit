import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/functions/barcode_sound.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/utils/app_colors.dart';
import 'package:my_markit/core/widgets/custom_elevated_button.dart';
import 'package:my_markit/core/widgets/error_text.dart';
import 'package:my_markit/featuers/srach_product/prsentation/manger/search_product_cuibt/search_product_cubit.dart';
import 'package:my_markit/featuers/srach_product/prsentation/widgets/dispaly_product.dart';

class SearchBarcodeBodyView extends StatelessWidget {
  const SearchBarcodeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<SearchProductCubit>(context);
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                  child: CustomElevatedButton(
                      onPressed: () async {
                        var res = await GoRouter.of(context)
                            .pushNamed(AppRouters.barcode);
                        if (res.toString().length >= 3) {
                          await barcodeSound();
                          // controller.barcode = res.toString();
                          controller.searchByBarcode(barcode: res.toString());
                        }
                      },
                      title: 'إدخـال الـباركود')),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
        BlocBuilder<SearchProductCubit, SearchProductState>(
          builder: (context, state) {
            switch (state) {
              case SearchProductFailure():
                return SliverFillRemaining(
                  child: ErrorText(errorMessage: state.errorMessage),
                );

              case SearchProductInitial():
                return const SliverFillRemaining(
                  child: ErrorText(errorMessage: 'قم بإدخال الباركود للبحث'),
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
                return SliverToBoxAdapter(
                    child: DisplayProduct(
                  productModel: state.prodcust[0],
                  isBarcode: true,
                ));
            }
          },
        )
      ],
    );
  }
}
