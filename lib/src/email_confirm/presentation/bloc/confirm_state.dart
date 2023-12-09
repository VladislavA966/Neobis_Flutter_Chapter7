part of 'confirm_bloc.dart';

@immutable
sealed class ConfirmState {}

final class ConfirmInitial extends ConfirmState {}

final class ConfirmLoading extends ConfirmState {}

final class ConfirmLoaded extends ConfirmState {
  final TokenEntity model;

  ConfirmLoaded({required this.model});
}

final class ConfirmError extends ConfirmState {
  final String errorText;

  ConfirmError({required this.errorText});
}
