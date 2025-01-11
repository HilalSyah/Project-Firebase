import 'package:get/get.dart';
import '../api/firebase_api.dart';
import 'profile_controller.dart'; // Import ProfileControllerFB

class LoginController extends GetxController {
  final isLoading = false.obs;
  final _firebaseApi = FirebaseApi();
  final ProfileControllerFB profileController = Get.put(ProfileControllerFB()); // Instance ProfileControllerFB

void login(String name, String email, String phone, String password) async {
  isLoading.value = true;

  // Simulasi login
  await Future.delayed(const Duration(seconds: 2));

  // Tampilkan notifikasi setelah login berhasil
  await _firebaseApi.showNotification(
    title: 'Login Berhasil',
    body: 'Selamat datang kembali, $name!',
  );

  // Update nama, email, dan nomor telepon di ProfileControllerFB
  profileController.updateProfile(name, email, phone, password);

  isLoading.value = false;
  Get.offAllNamed('/home');
}
}