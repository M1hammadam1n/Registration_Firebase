import 'package:fier/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:fier/ui/pages/register_page/register_page.dart';
import 'package:fier/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AuthPageEvent()),
      child: const AuthPageScaffold(),
    );
  }
}

class AuthPageScaffold extends StatelessWidget {
  const AuthPageScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthPageState) {
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Войти',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      controller: state.users.emailController,
                      labelText: 'Введите email',
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      controller: state.users.passwordController,
                      labelText: 'Введите пароль',
                      isShow: true,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          state.singInUser(context);
                        },
                        child: const Text('Войти'),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                            (route) => false);
                      },
                      child: const Text('нет Аккаунта ?  Зарегистрируйтесь'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
