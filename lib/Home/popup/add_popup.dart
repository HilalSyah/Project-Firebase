import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class AddTaskDialog extends StatelessWidget {
  AddTaskDialog({Key? key}) : super(key: key);

  final HomeController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Colors.blue.shade50, // Latar belakang dialog biru muda
      title: const Text(
        'Tambahkan Barang',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0, // Mengubah ukuran teks
          color: Color.fromARGB(255, 1, 21, 38), // Warna teks biru
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Nama Barang',
                labelStyle: TextStyle(color: Color.fromARGB(255, 1, 20, 35)), // Warna label biru
                prefixIcon: Icon(Icons.title, color: Color.fromARGB(255, 78, 158, 223)), // Warna ikon biru
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Warna border fokus biru
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                labelStyle: TextStyle(color: Color.fromARGB(255, 2, 24, 43)),
                prefixIcon: Icon(Icons.description, color: Color.fromARGB(255, 78, 158, 223)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
                labelStyle: TextStyle(color: Color.fromARGB(255, 1, 23, 41)),
                prefixIcon: Icon(Icons.image, color: Color.fromARGB(255, 78, 158, 223)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: 'Harga',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 7, 13)),
                prefixIcon: Icon(Icons.attach_money, color: Color.fromARGB(255, 78, 158, 223)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(); // Menutup dialog
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Warna tombol merah
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Membuat sudut lebih bulat
            ),
            elevation: 8.0, // Menambahkan efek bayangan
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0), // Menambah padding
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Warna teks putih dan tebal
          ),
        ),

        ElevatedButton(
          onPressed: () {
            final price = double.tryParse(priceController.text) ?? 0.0;
            controller.addTask(
              titleController.text,
              descriptionController.text,
              imageUrlController.text,
              price,
            );
            Get.back(); // Menutup dialog
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
            'Add',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Mengubah warna dan gaya teks
          ),
        ),
      ],
    );
  }
}