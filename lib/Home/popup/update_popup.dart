import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class UpdateTaskDialog extends StatelessWidget {
  final String id;
  final String currentTitle;
  final String currentDescription;
  final String currentImageUrl;
  final double currentPrice;

  UpdateTaskDialog({
    Key? key,
    required this.id,
    required this.currentTitle,
    required this.currentDescription,
    required this.currentImageUrl,
    required this.currentPrice,
  }) : super(key: key);

  final HomeController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with current values
    titleController.text = currentTitle;
    descriptionController.text = currentDescription;
    imageUrlController.text = currentImageUrl;
    priceController.text = currentPrice.toStringAsFixed(2);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Colors.blue.shade50, // Latar belakang dialog biru muda
      title: const Text(
        'Update Task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0, // Mengubah ukuran teks
          color: Colors.blue, // Warna teks biru
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.black), // Warna label biru
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
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.black),
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
                labelStyle: TextStyle(color: Colors.black),
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
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.black),
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
        TextButton(
          onPressed: () {
            Get.back(); // Menutup dialog
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.red), // Warna teks biru
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.updateTask(
              id,
              titleController.text,
              descriptionController.text,
              imageUrlController.text,
              double.tryParse(priceController.text) ?? 0.0, // Konversi ke double
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
            'Update',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // Mengubah warna dan gaya teks
          ),
        ),
      ],
    );
  }
}