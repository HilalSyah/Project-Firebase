import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_firebase/Service/GogleAuth.dart';
import 'package:project_firebase/components/custom_login.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../components/custom_textbutton.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController(); // Controller untuk nama
  final phoneController =
      TextEditingController(); // Controller untuk nomor telepon
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollView
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50), // Jarak atas
            Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            CustomTextField(
              hintText: 'Name', // Field untuk nama
              controller: nameController,
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
              hintText: 'Nomor Telepon', // Field untuk nomor telepon
              controller: phoneController,
              prefixIcon: Icons.phone,
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
                        nameController.text,
                        emailController.text,
                        phoneController.text, // Kirim nomor telepon
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
                  onPressed: () async {
                    try {
                      await Gogleauth().signInGoogle(context);
                    } catch (e) {
                      print("Error during Google Sign-In: $e");
                    }
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
            SizedBox(height: 30), // Jarak bawah
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
