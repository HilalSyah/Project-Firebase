import 'package:get/get.dart';

class ProfileControllerFB extends GetxController {
  var name = 'Arsya Fauz Marzuki'.obs;
  var email = 'Arsya@gmail.com'.obs;
  var phone = '081234567890'.obs;

  void updateProfile(String newName, String newEmail, String newPhone) {
    name.value = newName;
    email.value = newEmail;
    phone.value = newPhone;
  }
}
