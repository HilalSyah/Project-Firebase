import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_firebase/Profile/profile_controller.dart';

class EditProfilePage extends StatelessWidget {
  final ProfileControllerFB controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Isi TextField dengan data saat ini
    nameController.text = controller.name.value;
    emailController.text = controller.email.value;
    passwordController.text = controller.password.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade900, Colors.lightBlueAccent], // Warna gradien biru
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 12.0, // Menambahkan efek bayangan
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 2, 3)), // Warna label biru
                prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 78, 158, 223)), // Warna ikon biru
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Warna border fokus biru
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 78, 158, 223)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                prefixIcon: Icon(Icons.lock, color: Color.fromARGB(255, 78, 158, 223)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan aksi simpan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna tombol biru
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Membuat sudut lebih bulat
                  ),
                  elevation: 8.0, // Menambahkan efek bayangan
                  padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0), // Menambah padding
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Mengubah warna dan gaya teks
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}