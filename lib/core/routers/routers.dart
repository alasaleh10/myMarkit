import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/routers/page_animation.dart';

import 'package:my_markit/featuers/add_product/prsentation/views/add_product._view.dart';
import 'package:my_markit/featuers/debts/data/models/clint_model.dart';
import 'package:my_markit/featuers/debts/prsentation/views/add_clint_view.dart';
import 'package:my_markit/featuers/debts/prsentation/views/add_debet_view.dart';
import 'package:my_markit/featuers/debts/prsentation/views/debet_detiles_view.dart';
import 'package:my_markit/featuers/debts/prsentation/views/debts_view.dart';
import 'package:my_markit/featuers/debts/prsentation/views/display_debts_view.dart';
import 'package:my_markit/featuers/home/prsentation/views/home_view.dart';
import 'package:my_markit/featuers/invoice/prsentation/views/invoice_view.dart';
import 'package:my_markit/featuers/spalsh_screen/splash_view.dart';
import 'package:my_markit/featuers/srach_product/prsentation/views/edite_product_view.dart';
import 'package:my_markit/featuers/srach_product/prsentation/views/search_product_view.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

abstract class Routers {
  static final routers = GoRouter(routes: [
    GoRoute(
      path: AppRouters.splashView,
      pageBuilder: (context, state) => pageAnimation(
        page: const SplashView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.homeView}',
      name: AppRouters.homeView,
      pageBuilder: (context, state) => pageAnimation(
        page: const HomeView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.addProductView}',
      name: AppRouters.addProductView,
      pageBuilder: (context, state) => pageAnimation(
        page: const AddProductView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.barcode}',
      name: AppRouters.barcode,
      pageBuilder: (context, state) => pageAnimation(
        page: const SimpleBarcodeScannerPage(
          cancelButtonText: 'إلغاء',
        ),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.searchProductView}',
      name: AppRouters.searchProductView,
      pageBuilder: (context, state) => pageAnimation(
        page: const SearchPRoductView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.editProductView}',
      name: AppRouters.editProductView,
      pageBuilder: (context, state) => pageAnimation(
        page: EditProductView(
          data: state.extra as List,
        ),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.invoiceView}',
      name: AppRouters.invoiceView,
      pageBuilder: (context, state) => pageAnimation(
        page: const InvoiceView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.debtsView}',
      name: AppRouters.debtsView,
      pageBuilder: (context, state) => pageAnimation(
        page: const DebtsView(),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.addClintView}',
      name: AppRouters.addClintView,
      pageBuilder: (context, state) => pageAnimation(
        page: AddClintView(
          context2: state.extra as BuildContext,
        ),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.displayDebtsView}',
      name: AppRouters.displayDebtsView,
      pageBuilder: (context, state) => pageAnimation(
        page: DisplayDebtsView(
          clintModel: state.extra as ClintModel,
        ),
      ),
    ),
    GoRoute(
      path: '/${AppRouters.addDebtView}',
      name: AppRouters.addDebtView,
      pageBuilder: (context, state) => pageAnimation(
        page: AddDebtView(
          data: state.extra as List,
        ),
      ),
    ),
      GoRoute(
      path: '/${AppRouters.debetsDetilsView}',
      name: AppRouters.debetsDetilsView,
      pageBuilder: (context, state) => pageAnimation(
        page: DebetsDetilsView(
          data: state.extra as List,
        ),
      ),
    ),
  ]);
}
