part of 'display_invoicess_cubit.dart';

sealed class DisplayInvoicessState {}

final class DisplayInvoicessInitial extends DisplayInvoicessState {}

final class DisplayInvoicessLoading extends DisplayInvoicessState {}

final class DisplayInvoicessSucsess extends DisplayInvoicessState {
  final File file;

  DisplayInvoicessSucsess({required this.file});
}

final class DisplayInvoicessFailure extends DisplayInvoicessState {
  final String errorMessage;

  DisplayInvoicessFailure({required this.errorMessage});
}
