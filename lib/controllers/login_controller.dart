import 'package:get/get.dart';
import '../api/firebase_api.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final _firebaseApi = FirebaseApi();

  void login(String email, String password) async {
    isLoading.value = true;

    // Simulasi login
    await Future.delayed(const Duration(seconds: 2));

    // Tampilkan notifikasi setelah login berhasil
    await _firebaseApi.showNotification(
      title: 'Login Berhasil',
      body: 'Selamat datang kembali, $email!',
    );

    isLoading.value = false;
    Get.offAllNamed('/home');
  }
}
