part of 'clints_cubit.dart';

sealed class ClintsState {}

final class ClintsInitial extends ClintsState {}

final class ClintsFailure extends ClintsState {
  final String errorMessage;

  ClintsFailure({required this.errorMessage});
}

final class ClintsSucsess extends ClintsState {
  final List<ClintModel> clints;

  ClintsSucsess({required this.clints});
}

final class ClintsLoading extends ClintsState {}

final class ClintsSucsess2 extends ClintsState {}
