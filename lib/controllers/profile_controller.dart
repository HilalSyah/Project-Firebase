import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileControllerFB extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String get uid => FirebaseAuth.instance.currentUser?.uid ?? '';

  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs; // Tambahkan variabel untuk password

  Future<void> getDataprofile() async {
    try {
      if (uid.isNotEmpty) {
        DocumentSnapshot userDoc =
            await firebaseFirestore.collection("users").doc(uid).get();
        if (userDoc.exists) {
          name.value = userDoc['displayName'] ?? 'Nama tidak tersedia';
          email.value = userDoc['email'] ?? 'Email tidak tersedia';
        } else {
          print("Dokumen pengguna tidak ditemukan");
        }
      } else {
        print("UID pengguna tidak valid");
      }
    } catch (e) {
      print("Error mengambil data pengguna: $e");
    }
  }

  Future<void> updateProfile(
      String newName, String newEmail, String newPassword) async {
    try {
      // Update data di Firestore
      if (uid.isNotEmpty) {
        await firebaseFirestore.collection("users").doc(uid).update({
          'displayName': newName,
          'email': newEmail,
          'password': newPassword, // Simpan password (jika diperlukan)
        });

        // Update data lokal
        name.value = newName;
        email.value = newEmail;
        password.value = newPassword;

        Get.snackbar("Sukses", "Profil berhasil diperbarui!");
      } else {
        print("UID pengguna tidak valid");
      }
    } catch (e) {
      print("Gagal memperbarui profil: $e");
      Get.snackbar("Error", "Gagal memperbarui profil!");
    }
  }
}
