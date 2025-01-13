import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> fetchProfile() async {
    try {
      final docRef = FirebaseFirestore.instance.collection('users').doc(
          '6xIwg3ZzfuYHoLGXfdHUiuVVbbn1'); // Ganti dengan ID user yang sesuai

      DocumentSnapshot doc = await docRef.get();
      if (doc.exists) {
        name.value = doc['displayName'] ?? ''; // Ambil data name
        email.value = doc['email'] ?? ''; // Ambil data email
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print("Failed to fetch profile: $e");
    }
  }
}
