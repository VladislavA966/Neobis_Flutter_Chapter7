part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

final class AuthBlocLoading extends AuthBlocState {}

final class AuthBlocLoaded extends AuthBlocState {}

final class AuthBlocError extends AuthBlocState {
  final String errorText;

  AuthBlocError({required this.errorText});
}
