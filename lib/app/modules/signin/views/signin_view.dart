import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../widgets/input_field.dart';
import '../../../widgets/primary_button.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                    ),
                    const SizedBox(height: 32),
                    SvgPicture.asset(
                      'assets/svg/login.svg',
                      width: size.width * .6,
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      controller: controller.emailController,
                      labelText: 'Email',
                      maxLength: 25,
                      inputType: TextInputType.emailAddress,
                      validator: controller.emailValidator,
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      controller: controller.passwordController,
                      isPassword: true,
                      labelText: 'Password',
                      maxLength: 25,
                      validator: controller.passwordValidator,
                    ),
                    const SizedBox(height: 32),
                    Obx(() => PrimaryButton(
                          text: 'Sign Up',
                          onPressed: controller.signIn,
                          isLoading: controller.isLoading.value,
                          backgroundColor: Colors.black,
                        )),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: 'Already have an account ?  ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                  text: 'Sign in',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ]),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
