import 'package:get/get.dart';
import 'package:project_firebase/Service/firebase_api.dart';
import 'profile_controller.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final _firebaseApi = FirebaseApi();
  final ProfileControllerFB profileController = Get.put(ProfileControllerFB());

  void login(String name, String email, String password) async {
    isLoading.value = true;

    // Simulasi login
    await Future.delayed(const Duration(seconds: 2));

    // Tampilkan notifikasi setelah login berhasil
    await _firebaseApi.showNotification(
      title: 'Login Berhasil',
      body: 'Selamat datang kembali, $name!',
    );

    // Update nama dan email di ProfileControllerFB
    profileController.updateProfile(name, email, password);

    isLoading.value = false;
    Get.offAllNamed('/home');
  }
}
