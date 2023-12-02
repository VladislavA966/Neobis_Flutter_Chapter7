part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class ValidationEvent extends RegistrationEvent {
  final String password;

  ValidationEvent({required this.password});
}
