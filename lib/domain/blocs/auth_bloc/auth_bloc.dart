import 'package:bloc/bloc.dart';
import 'package:fier/domain/models/users.dart';
import 'package:fier/ui/router/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegistrationPageEvent>((event, emit) {
      emit(RegistrationPageState());
    });
    on<AuthPageEvent>((event, emit) {
      emit(AuthPageState());
    });
  }
}
