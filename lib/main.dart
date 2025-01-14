import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:project_firebase/Bin/Home_Binding.dart';
import 'package:project_firebase/Bin/Login_Binding.dart';
import 'package:project_firebase/Bin/SignUp_Binding.dart';
import 'package:project_firebase/Bin/SplashScreen_Binding.dart';
import 'package:project_firebase/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/bottom_nav.dart';
import 'package:project_firebase/controllers/profile_controller.dart';
import 'package:project_firebase/Service/firebase_api.dart';
import 'screens/cart_screen.dart';
import 'controllers/cart_controller.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(ProfileControllerFB());
  Get.put(CartController());

  // Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize Firebase API
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => SplashScreen(),
            binding: SplashScreenBinding()),
        GetPage(
            name: '/login', page: () => LoginScreen(), binding: LoginBinding()),
        GetPage(
            name: '/signup',
            page: () => SignUpScreen(),
            binding: SignUpBinding()),
        GetPage(name: '/home', page: () => BottomNav(), binding: HomeBinding()),
      ],
    );
  }
}
