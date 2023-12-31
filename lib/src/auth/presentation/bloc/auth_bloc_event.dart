part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class GetAuthEvent extends AuthBlocEvent {
  final String email;
  final String password;

  GetAuthEvent({required this.email, required this.password});
}
