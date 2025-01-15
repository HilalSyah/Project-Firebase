import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/before/custom_button.dart'; // Import custom button
import '../components/before/custom_text.dart';
import '../controllers/before_login_controller.dart';
import '../Service/GogleAuth.dart';

class BeforeLogin extends StatelessWidget {
  const BeforeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BeforeLoginController());

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 600;

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur posisi atas dan bawah
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: isSmallScreen ? 50 : 100),
                          Text(
                            "Explore now",
                            style: TextStyle(
                              fontSize: isSmallScreen ? 40 : 55,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'WorkSans',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Join SO today.",
                            style: TextStyle(
                              fontSize: isSmallScreen ? 20 : 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'WorkSans',
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 20 : 30),
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
                            textSize: isSmallScreen ? 18 : 22,
                          ),
                          SizedBox(height: 15),
                          CustomButton(
                            text: "Continue with Facebook",
                            onPressed: controller.onFacebookPressed,
                            imagePath: 'assets/images/facebooklogo.png',
                            textSize: isSmallScreen ? 18 : 22,
                          ),
                          SizedBox(height: isSmallScreen ? 20 : 30),
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
                          SizedBox(height: isSmallScreen ? 20 : 30),
                          CustomButton(
                            text: "Create account",
                            onPressed: () {
                              Get.offAllNamed('/signup');
                            },
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            height: isSmallScreen ? 60 : 70,
                            textSize: isSmallScreen ? 20 : 25,
                          ),
                          SizedBox(height: isSmallScreen ? 40 : 60),
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 16 : 18,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: isSmallScreen ? 0 : 30),
                          CustomButton(
                            text: "Login",
                            onPressed: () {
                              Get.offAllNamed('/login');
                            },
                            backgroundColor: Colors.white,
                            textColor: Colors.blue,
                            height: isSmallScreen ? 60 : 70,
                            textSize: isSmallScreen ? 20 : 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Teks di bagian bawah
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CustomText(
                      text:
                      'By signing up, you agree to the Terms of Service and Privacy Policy,\n including Cookie Use.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}