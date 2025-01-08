import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            CustomTextField(
              hintText: 'Email',
              controller: emailController,
              prefixIcon: Icons.email,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: 'Password',
              controller: passwordController,
              obscureText: true,
              prefixIcon: Icons.lock,
            ),
            SizedBox(height: 30),
            Obx(() => signUpController.isLoading.value
                ? CircularProgressIndicator()
                : CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      signUpController.signUp(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                  )),
          ],
        ),
      ),
    );
  }
}
