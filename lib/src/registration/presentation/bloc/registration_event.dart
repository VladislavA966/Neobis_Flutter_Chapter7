part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}

class ValidationEvent extends RegistrationEvent {
  final String password;

  ValidationEvent({required this.password});
}

class SendRegistrationData extends RegistrationEvent {
  final String email;

  final String login;
  final String passwrod;

  SendRegistrationData(
      {required this.email, required this.login, required this.passwrod});
}
