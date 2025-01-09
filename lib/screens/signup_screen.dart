import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../components/custom_login.dart';
import '../components/custom_textbutton.dart';
import '../controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
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
                    hintText: 'Username',
                    controller: usernameController,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 10),
                  Obx(() => signUpController.errorMessage.value.isNotEmpty
                      ? Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: signUpController.errorMessage.value ==
                                    'Semua field harus diisi'
                                ? Colors.orange.withOpacity(0.1)
                                : Colors.red.withOpacity(0.1),
                            border: Border.all(
                              color: signUpController.errorMessage.value ==
                                      'Semua field harus diisi'
                                  ? Colors.orange.withOpacity(0.3)
                                  : Colors.red.withOpacity(0.3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                signUpController.errorMessage.value ==
                                        'Semua field harus diisi'
                                    ? Icons.warning_amber_rounded
                                    : Icons.error_outline,
                                color: signUpController.errorMessage.value ==
                                        'Semua field harus diisi'
                                    ? Colors.orange
                                    : Colors.red,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  signUpController.errorMessage.value,
                                  style: TextStyle(
                                    color:
                                        signUpController.errorMessage.value ==
                                                'Semua field harus diisi'
                                            ? Colors.orange[700]
                                            : Colors.red[700],
                                    fontSize: 12,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox()),
                  SizedBox(height: 20),
                  Obx(() => signUpController.isLoading.value
                      ? CircularProgressIndicator()
                      : CustomButton(
                          text: 'Sign Up',
                          onPressed: () {
                            signUpController.signUp(
                              usernameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        )),
                  SizedBox(height: 20),
                  Text(
                    'or sign up with',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Customlogin(
                        onPressed: () {
                          print('Google pressed');
                        },
                        backgroundColor: Colors.white,
                        imagePath: 'assets/images/logogoogle.png',
                        imageSize: 18,
                      ),
                      SizedBox(width: 20),
                      Customlogin(
                        onPressed: () {
                          print('Facebook pressed');
                        },
                        backgroundColor: Colors.white,
                        imagePath: 'assets/images/facebooklogo.png',
                        imageSize: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomRichTextButton(
              firstText: 'Already have an account? ',
              secondText: 'Login',
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
