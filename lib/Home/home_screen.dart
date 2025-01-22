import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_firebase/Home/popup/add_popup.dart';
import 'package:project_firebase/Home/popup/update_popup.dart';
import '../components/CustomCard.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Toko',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0, // Mengubah ukuran teks
            color: Colors.white, // Mengubah warna teks
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.blue
          ),
        ),
        elevation: 10.0, // Menambahkan efek bayangan
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/profile');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.person, color: Colors.white), // Mengubah warna ikon
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Tambahkan padding di sekitar ListView
        child: StreamBuilder<QuerySnapshot>(
          stream: controller.tasksStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final tasks = snapshot.data!.docs;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dua kartu per baris
                childAspectRatio: 0.7, // Rasio aspek untuk menyesuaikan tinggi kartu
                crossAxisSpacing: 8.0, // Spasi antar kolom
                mainAxisSpacing: 8.0, // Spasi antar baris
              ),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                final data = task.data() as Map<String, dynamic>;

                // Log nilai price sebelum konversi
                print('Price from data: ${data['price']}');

                // Konversi price dari String ke double
                final price = double.tryParse(data['price'].toString()) ?? 0.0;

                // Log nilai price setelah konversi
                print('Converted price: $price');

                return CustomCard(
                  imageUrl: data['imageUrl'] ?? '',
                  title: data['title'] ?? 'No Title',
                  description: data['description'] ?? 'No Description',
                  price: price, // Gunakan nilai yang sudah dikonversi
                  onupdate: () {
                    Get.dialog(
                      UpdateTaskDialog(
                        id: task.id,
                        currentTitle: data['title'] ?? '',
                        currentDescription: data['description'] ?? '',
                        currentImageUrl: data['imageUrl'] ?? '',
                        currentPrice: price,
                      ),
                    );
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          backgroundColor: Colors.blue.shade50, // Latar belakang dialog biru muda
                          title: Row(
                            children: const [
                              Icon(Icons.warning, color: Colors.redAccent), // Ikon peringatan
                              SizedBox(width: 8),
                              Text(
                                'Konfirmasi Hapus',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue, // Warna teks biru
                                ),
                              ),
                            ],
                          ),
                          content: const Text(
                            'Apakah Anda yakin ingin menghapus tugas ini?',
                            style: TextStyle(color: Colors.black87),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Menutup dialog
                              },
                              child: const Text(
                                'Batal',
                                style: TextStyle(color: Colors.blue), // Warna teks biru
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.deleteTask(task.id);
                                Navigator.of(context).pop(); // Menutup dialog
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent, // Warna tombol merah
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 5.0, // Menambahkan efek bayangan
                              ),
                              child: const Text(
                                'Hapus',
                                style: TextStyle(color: Colors.white), // Warna teks putih
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(AddTaskDialog()),
        backgroundColor: Colors.blue, // Warna tombol biru
        elevation: 8.0, // Menambahkan efek bayangan
        child: const Icon(
          Icons.add,
          color: Colors.white, // Mengubah warna ikon
          size: 28.0, // Menambah ukuran ikon
        ),
      ),
    );
  }
}