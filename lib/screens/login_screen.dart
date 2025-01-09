import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_firebase/components/custom_login.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../components/custom_textbutton.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginController = Get.put(LoginController());

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
                    'Login',
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
                  Obx(() => loginController.isLoading.value
                      ? CircularProgressIndicator()
                      : CustomButton(
                          text: 'Login',
                          onPressed: () {
                            loginController.login(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                        )),
                  SizedBox(height: 20),
                  Text(
                    'or login with',
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
                        text: 'Google',
                        onPressed: () {
                          print('Google pressed');
                        },
                        backgroundColor: Colors.white,
                        textColor: Colors.grey,
                        imagePath: 'assets/images/logogoogle.png',
                        imageSize: 18,
                      ),
                      SizedBox(width: 20),
                      Customlogin(
                        text: 'Facebook',
                        onPressed: () {
                          print('Facebook pressed');
                        },
                        backgroundColor: Colors.white,
                        textColor: Colors.grey,
                        imagePath: 'assets/images/facebooklogo.png',
                        imageSize: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomRichTextButton(
              firstText: 'Don\'t have an account? ',
              secondText: 'Sign Up',
              onPressed: () => Get.toNamed('/signup'),
            ),
          ],
        ),
      ),
    );
  }
}
