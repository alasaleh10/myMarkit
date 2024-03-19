import 'package:go_router/go_router.dart';
import 'package:my_markit/core/routers/app_routers.dart';
import 'package:my_markit/core/routers/page_animation.dart';

import 'package:my_markit/featuers/add_product/prsentation/views/add_product._view.dart';
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
  ]);
}
