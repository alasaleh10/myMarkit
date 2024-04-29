part of 'get_invoicsess_cubit.dart';

sealed class GetInvoicsessState {}

final class GetInvoicsessInitial extends GetInvoicsessState {}

final class GetInvoicsessLoading extends GetInvoicsessState {}

final class GetInvoicsessSucsess2 extends GetInvoicsessState {}

final class GetInvoicsessFailure extends GetInvoicsessState {
  final String errorMessage;

  GetInvoicsessFailure({required this.errorMessage});
}

final class GetInvoicsessSucsess extends GetInvoicsessState {
  final List<InvoiveClintModel> invoicess;

  GetInvoicsessSucsess({required this.invoicess});
}
