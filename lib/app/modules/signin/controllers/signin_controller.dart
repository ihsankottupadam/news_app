import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/data/services/auth_servcice.dart';

class SigninController extends GetxController {
  RxBool isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signIn() async {
    if (!formKey.currentState!.validate()) return;
    isLoading.value = true;
    await AuthService.signUp(emailController.text, passwordController.text);
    isLoading.value = false;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? emailValidator(String? val) {
    if (val == null) return null;
    if (val.isEmpty) return 'Enter Email';
    if (!val.isEmail) {
      return 'Please enter valid email';
    }
    return null;
  }

  String? passwordValidator(String? val) {
    if (val == null) return null;
    if (val.isEmpty) return 'Enter Password';
    if (val.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }
}
