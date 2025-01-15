import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Service/Auth.dart';
import '../Service/GogleAuth.dart';
import '../components/before/custom_text.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isSmallScreen ? 50 : 100),

                  // Header Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey, Hello 👋",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 25 : 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Enter your credentials to access \n your account",
                        style: TextStyle(
                          fontSize: isSmallScreen ? 16 : 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallScreen ? 40 : 60),

                  // Social Login Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Customlogin(
                          onPressed: () async {
                            try {
                              await Gogleauth().signInGoogle(context);
                            } catch (e) {
                              print("Error during Google Sign-In: $e");
                            }
                          },
                          backgroundColor: Colors.white,
                          imagePath: 'assets/images/logogoogle.png',
                          imageSize: isSmallScreen ? 25 : 30,
                          text: 'Google',
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 15 : 20),
                      Flexible(
                        child: Customlogin(
                          onPressed: () {
                            print('Facebook pressed');
                          },
                          backgroundColor: Colors.white,
                          imagePath: 'assets/images/facebooklogo.png',
                          imageSize: isSmallScreen ? 25 : 30,
                          text: 'Facebook',
                        ),
                      ),
                    ],
                  ),


                  SizedBox(height: isSmallScreen ? 15 : 20),

                  // Divider with "or"
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomText(
                          text: 'or',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: isSmallScreen ? 15 : 20),

                  // Input Fields
                  CustomTextField(
                    hintText: '',
                    controller: usernameController,
                    obscureText: false,
                    labelText: 'Username',
                  ),
                  CustomTextField(
                    hintText: '',
                    controller: emailController,
                    obscureText: false,
                    labelText: 'Email',
                  ),
                  CustomTextField(
                    hintText: '',
                    controller: passwordController,
                    obscureText: true,
                    labelText: 'Password',
                  ),

                  SizedBox(height: isSmallScreen ? 8 : 10),

                  // Error Message
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
                          size: isSmallScreen ? 18 : 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            signUpController.errorMessage.value,
                            style: TextStyle(
                              color: signUpController.errorColor,
                              fontSize: isSmallScreen ? 10 : 12,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : SizedBox()),

                  SizedBox(height: isSmallScreen ? 15 : 20),

                  // Sign-Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final username = usernameController.text;
                        final email = emailController.text;
                        final password = passwordController.text;

                        if (signUpController.validateEmptyFields(
                            username, email, password) &&
                            signUpController.validateUsername(username) &&
                            signUpController.validateEmail(email) &&
                            signUpController.validatePassword(password)) {
                          signUpController.signUp(username, email, password);
                          AuthService().signup(
                            username: username,
                            email: email,
                            password: password,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: isSmallScreen ? 12 : 15.0,
                        ),
                        minimumSize: Size(500, isSmallScreen ? 35 : 40),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 20 : 25,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: isSmallScreen ? 15 : 20),

                  // Login Redirect
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomRichTextButton(
                      firstText: 'Already have an account? ',
                      secondText: 'Login',
                      onPressed: () {
                        Get.offAllNamed('/login');
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
