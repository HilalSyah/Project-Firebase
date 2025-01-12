import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_firebase/controllers/profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  final ProfileControllerFB controller = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Inisialisasi input dengan data lama
    nameController.text = controller.name.value;
    emailController.text = controller.email.value;
    passwordController.text = controller.password.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
        backgroundColor: Color(0xFFB2D3C2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                String newName = nameController.text.trim();
                String newEmail = emailController.text.trim();
                String newPassword = passwordController.text.trim();

                // Panggil metode updateProfile
                controller.updateProfile(newName, newEmail, newPassword);
              },
              child: Text('Simpan Perubahan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB2D3C2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
