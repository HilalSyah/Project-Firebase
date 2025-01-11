import 'package:get/get.dart';

class ProfileControllerFB extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs; // Tambahkan variabel untuk password

  void updateProfile(String newName, String newEmail, String newPhone, String newPassword) {
    name.value = newName;
    email.value = newEmail;
    phone.value = newPhone;
    password.value = newPassword; // Simpan password
  }
}
