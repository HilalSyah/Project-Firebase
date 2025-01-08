import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkAuth();
  }

  void checkAuth() {

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/login');
    });
  }
}
