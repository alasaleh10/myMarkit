part of 'invoice_cubit.dart';

sealed class InvoiceState {}

final class InvoiceInitial extends InvoiceState {}

final class InvoiceSucsess extends InvoiceState {
  final List<ProductModel> products;

  InvoiceSucsess({required this.products});
}

final class InvoiceLoading extends InvoiceState {}

final class InvoiceLoading2 extends InvoiceState {}

final class InvoiceSucsess2 extends InvoiceState {}

final class InvoiceFailure extends InvoiceState {
  final String errorMessage;

  InvoiceFailure({required this.errorMessage});
}

final class InvoiceFailure2 extends InvoiceState {
  final String errorMessage;

  InvoiceFailure2({required this.errorMessage});
}
