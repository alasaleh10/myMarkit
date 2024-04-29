part of 'debts_detils_cubit.dart';

sealed class DebtsDetilsState {}

final class DebtsDetilsInitial extends DebtsDetilsState {}

final class DebtsDetilsLoading extends DebtsDetilsState {}

final class DebtsDetilsFailure extends DebtsDetilsState {
  final String errorMessage;

  DebtsDetilsFailure({required this.errorMessage});
}

final class DebtsDetilsSucsess extends DebtsDetilsState {}
