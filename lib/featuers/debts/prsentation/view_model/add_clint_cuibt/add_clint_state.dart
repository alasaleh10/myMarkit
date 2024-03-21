part of 'add_clint_cubit.dart';

sealed class AddClintState {}

final class AddClintInitial extends AddClintState {}

final class AddClintFailure extends AddClintState {
  final String errorMessage;

  AddClintFailure({required this.errorMessage});
}

final class AddClintSucsess1 extends AddClintState {
  final List<ClintModel> clints;

  AddClintSucsess1({required this.clints});
}

final class AddClintLoading extends AddClintState {}

final class AddClintSucsess2 extends AddClintState {}
