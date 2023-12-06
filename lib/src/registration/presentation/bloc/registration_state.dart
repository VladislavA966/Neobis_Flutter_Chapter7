part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

class ValidationState extends RegistrationState {
  final bool passwordLength;
  final bool passwordUpperCase;
  final bool number;
  final bool symbol;
  final bool isValid;

  ValidationState(
      {required this.passwordLength,
      required this.passwordUpperCase,
      required this.number,
      required this.symbol,
      required this.isValid});
}

class SendRegistrationDataLoading extends RegistrationState {}

class SendRegistrationDataLoaded extends RegistrationState {}

class SendRegistrationDataError extends RegistrationState {
  final String errorText;

  SendRegistrationDataError({required this.errorText});
}
