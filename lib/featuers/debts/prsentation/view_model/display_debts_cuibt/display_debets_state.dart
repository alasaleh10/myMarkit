part of 'display_debets_cubit.dart';

sealed class DisplayDebetsState {}

final class DisplayDebetsInitial extends DisplayDebetsState {}

final class DisplayDebetsSucsess extends DisplayDebetsState {
  final List<DebetsModel> debets;

  DisplayDebetsSucsess({required this.debets});
}

final class DisplayDebetsFailure extends DisplayDebetsState {
  final String errorMessage;

  DisplayDebetsFailure({required this.errorMessage});
}

final class DisplayDebetsLoading extends DisplayDebetsState {}

final class DisplayDebetsSucsess2 extends DisplayDebetsState {}
