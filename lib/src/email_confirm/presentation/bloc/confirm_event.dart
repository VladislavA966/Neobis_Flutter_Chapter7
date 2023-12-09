part of 'confirm_bloc.dart';

@immutable
sealed class ConfirmEvent {}

class ConfirmByCodeEvent extends ConfirmEvent {
  final String code;

  ConfirmByCodeEvent({required this.code});
}
