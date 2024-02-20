import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users {
  //Controller
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //user registration
  Future<void> signUp() async {
    if (passwordConfirmed() &&
        emailController.text.trim() != '' &&
        passwordController.text.trim() != '' &&
        confirmPasswordController.text.trim() != '') {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
    addUserDetails(
      firstName: nameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
    );
  }

  //dobavleniyer danih polziviteleya
  Future<void> addUserDetails({
    String firstName = '',
    String lastName = ' ',
    String email = '',
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .set({
      'name': firstName,
      'last-name': lastName,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future signIn() async {
    if (emailController.text.trim() == '' &&
        passwordController.text.trim() == '') {
      return;
    } else {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }
  }

  Future<void> signAppOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static fromJson(e) {}
}
