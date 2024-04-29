part of 'delete_clint_cubit.dart';

sealed class DeleteClintState {}

final class DeleteClintInitial extends DeleteClintState {}

final class DeleteClintFailure extends DeleteClintState {
  final String errorMessage;

  DeleteClintFailure({required this.errorMessage});
}

final class DeleteClintSucsess extends DeleteClintState {}
