import 'package:get/get.dart';

class ProfileControllerFB extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs; // Tambahkan variabel untuk password

  void updateProfile(String newName, String newEmail, String newPassword) {
    name.value = newName;
    email.value = newEmail;
    password.value = newPassword; // Simpan password
  }
}
