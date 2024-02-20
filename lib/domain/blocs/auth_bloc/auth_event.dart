part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class RegistrationPageEvent extends AuthEvent {}
class AuthPageEvent extends AuthEvent {}