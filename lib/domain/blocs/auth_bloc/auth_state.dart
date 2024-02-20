part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final users = Users();
}

final class AuthInitial extends AuthState {}

final class RegistrationPageState extends AuthState {
  Future<void> singUpUser(BuildContext context) async {
    users.signUp().then(
      (value) => Navigator.pushNamed(
          context,
          AppRoutes.homaPage,
        ));
  }
}

final class AuthPageState extends AuthState {
  Future<void> singInUser(BuildContext context) async {
    users.signIn().then((value) => Navigator.pushNamed(
      context,
      AppRoutes.homaPage,
    ));
  }
}

final class SingOutAppState extends AuthState {
  Future<void> appssingOut() async {
    users.signAppOut();
  }
}
