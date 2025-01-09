import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_firebase/Service/Auth.dart';
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
                            color: signUpController.errorBackgroundColor,
                            border: Border.all(
                              color: signUpController.errorBorderColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                signUpController.errorIcon,
                                color: signUpController.errorColor,
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  signUpController.errorMessage.value,
                                  style: TextStyle(
                                    color: signUpController.errorColor,
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
                            // Ambil input dari TextField
                            final username = usernameController.text;
                            final email = emailController.text;
                            final password = passwordController.text;

                            // Validasi input
                            if (signUpController.validateEmptyFields(
                                    username, email, password) &&
                                signUpController.validateUsername(username) &&
                                signUpController.validateEmail(email) &&
                                signUpController.validatePassword(password)) {
                              // Jika validasi berhasil, lakukan signup
                              signUpController.signUp(
                                  username, email, password);
                              AuthService()
                                  .signup(Email: email, Password: password);
                            }
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
