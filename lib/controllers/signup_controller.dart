import 'package:get/get.dart';

class SignUpController extends GetxController {
  final isLoading = false.obs;

  void signUp(String email, String password) {
    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offAllNamed('/home');
    });
  }
}
