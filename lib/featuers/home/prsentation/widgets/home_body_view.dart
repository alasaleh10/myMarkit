import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/responsive_adaptive_helper/screen_size.dart';
import 'package:my_markit/core/routers/app_routers.dart';

import 'package:my_markit/core/utils/app_images.dart';

import 'package:my_markit/featuers/home/prsentation/widgets/image_column.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: screenHeight(context) * .1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageColumn(
                title: 'إضافة منتج',
                image: Assets.imagesAdd,
                onTap: () async {
                  GoRouter.of(context).pushNamed(AppRouters.addProductView);
                }),
            ImageColumn(
                title: 'بحث عن منتج',
                image: Assets.imagesSearch,
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRouters.searchProductView);
                })
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageColumn(
                title: 'إضافة فـاتورة',
                image: Assets.imagesInvoice,
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRouters.invoiceView);
                }),
            ImageColumn(
                title: 'الــديون',
                image: Assets.imagesDebts,
                onTap: () {
                  GoRouter.of(context).pushNamed(AppRouters.debtsView);
                }),
          ],
        ),
        const SizedBox(height: 20),
        ImageColumn(
          title: 'عــرض الفواتــير',
          image: Assets.imagesDisplayInvoicess,
          onTap: () {
            GoRouter.of(context).pushNamed(AppRouters.invoicessView);
          },
        )
      ],
    );
  }
}
