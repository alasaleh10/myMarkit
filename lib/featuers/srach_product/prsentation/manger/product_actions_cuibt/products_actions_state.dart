part of 'products_actions_cubit.dart';

sealed class ProductsActionsState {}

final class ProductsActionsInitial extends ProductsActionsState {}

final class ProductsActionsFailure extends ProductsActionsState {
  final String errorMessage;

  ProductsActionsFailure({required this.errorMessage});
}

final class ProductsActionsLoading extends ProductsActionsState {}

final class ProductsActionsSucsess extends ProductsActionsState {}

final class ProductsActionsSucsess2 extends ProductsActionsState {}
