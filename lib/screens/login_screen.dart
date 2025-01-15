import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Service/GogleAuth.dart';
import '../components/before/custom_text.dart';
import '../components/before/custom_button.dart';
import '../components/custom_textfield.dart';
import '../components/custom_login.dart';
import '../components/custom_textbutton.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Memungkinkan scroll pada layar kecil
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar di atas
            Container(
              width: double.infinity,
              height: 300,  // Tentukan tinggi gambar secara eksplisit
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Judul di atas form
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Let’s Connect With Us!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'WorkSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Form input
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

                  SizedBox(height: 30),

                  // Tombol login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.login(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 15.0,
                        ),
                        minimumSize: Size(double.infinity, 40),  // Ukuran penuh
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Separator
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
                  SizedBox(height: 30),

                  // Tombol sign up dengan Google
                  CustomButton(
                    text: "Sign up with Google",
                    onPressed: () async {
                      try {
                        await Gogleauth().signInGoogle(context);
                      } catch (e) {
                        print("Error during Google Sign-In: $e");
                      }
                    },
                    imagePath: 'assets/images/logogoogle.png',
                    textSize: 22,
                  ),
                  CustomButton(
                    text: "Continue with Facebook",
                    onPressed: () {},
                    imagePath: 'assets/images/facebooklogo.png',
                    textSize: 22,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CustomRichTextButton(
                firstText: "Don't have an account? ",
                secondText: 'Sign up',
                onPressed: () {
                  Get.offAllNamed('/signup');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
