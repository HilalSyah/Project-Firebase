import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/profile');  // Navigasi dengan animasi
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Memberikan jarak antara foto dan tepi
              child: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/a/ACg8ocJPlHdLVFmob1OsaReHyUavuO5_KgYEDm3a7WoFcarrCTfRKg=s96-c',
                    width: 40, // Sesuaikan lebar gambar
                    height: 40, // Sesuaikan tinggi gambar
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter, // Menempatkan tombol di tengah atas
        child: ElevatedButton(
          onPressed: controller.addItem,
          child: const Text('Tambahkan Barang'),
        ),
      ),
    );
  }
}
