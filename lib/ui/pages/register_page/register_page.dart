import 'package:fier/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:fier/ui/pages/login_page/login_page.dart';
import 'package:fier/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(RegistrationPageEvent()),
      child: const RegScaffoldWidget(),
    );
  }
}

class RegScaffoldWidget extends StatelessWidget {
  const RegScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is RegistrationPageState) {
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
                    'регтистрация',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: state.users.nameController,
                    labelText: 'Введите Имя',
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: state.users.lastNameController,
                    labelText: 'Введите Фамилию',
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller:  state.users.emailController,
                    labelText: 'Введите email',
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller:  state.users.passwordController,
                    labelText: 'Введите пароль',
                    isShow: true,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller:  state.users.confirmPasswordController,
                    labelText: 'подтвердите пароль',
                    isShow: true,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        state.singUpUser(context);
                      },
                      child: const Text('регистрация'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false);
                    },
                    child: const Text('Есть Аккаунта ?  Афторизуйтесь'),
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
