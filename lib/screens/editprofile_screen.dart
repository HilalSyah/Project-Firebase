import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  final ProfileControllerFB controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =
      TextEditingController(); // Tambahkan controller untuk password

  @override
  Widget build(BuildContext context) {
    // Isi TextField dengan data saat ini
    nameController.text = controller.name.value;
    emailController.text = controller.email.value;
    passwordController.text =
        controller.password.value; // Isi password jika ada

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFFB2D3C2), // Warna AppBar
      ),
      body: Container(
        color: Color(0xFFF5F5DC), // Mengubah warna latar belakang menjadi krem
        padding: EdgeInsets.all(20),
        child: ListView(
          // Menggunakan ListView untuk memungkinkan scroll otomatis
          children: [
            // Input untuk Nama
            TextField(
              controller: nameController,
              maxLength: 30, // Membatasi panjang karakter menjadi 30
              decoration: InputDecoration(
                labelText: 'Nama',
                labelStyle: TextStyle(color: Color(0xFFB2D3C2)), // Warna label
                border: OutlineInputBorder(),
                counterText: '', // Menyembunyikan penghitung karakter
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z\s]')), // Hanya mengizinkan huruf dan spasi
              ],
            ),
            SizedBox(height: 20),
            // Input untuk Email
            TextField(
              controller: emailController,
              maxLength: 30, // Membatasi panjang karakter menjadi 30
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color(0xFFB2D3C2)), // Warna label
                border: OutlineInputBorder(),
                counterText: '', // Menyembunyikan penghitung karakter
              ),
            ),
            SizedBox(height: 20),
            // Input untuk Nomor Telepon

            SizedBox(height: 20),
            // Input untuk Password
            TextField(
              controller: passwordController,
              obscureText: true, // Menyembunyikan karakter password
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color(0xFFB2D3C2)), // Warna label
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Perbarui data di controller
                  controller.updateProfile(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                    ''
                  );
                  Get.back(); // Kembali ke halaman Profile
                },
                child: Text(
                  'Simpan',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB2D3C2), // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
