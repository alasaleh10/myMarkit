part of 'add_debet_cubit.dart';

@immutable
sealed class AddDebetState {}

final class AddDebetInitial extends AddDebetState {}

final class AddDebetFailure extends AddDebetState {
  final String errorMessage;

  AddDebetFailure({required this.errorMessage});
}

final class AddDebetSucsess extends AddDebetState {}

final class AddDebetLoading extends AddDebetState {}
