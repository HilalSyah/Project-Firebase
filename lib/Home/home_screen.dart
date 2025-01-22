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

            if (tasks.isEmpty) {
              return const Center(
                child: Text(
                  'Tidak ada data',
                  style: TextStyle(
                    fontSize: 18.0, // Ukuran teks
                    fontWeight: FontWeight.bold, // Teks tebal
                    color: Colors.blueGrey, // Warna teks
                  ),
                ),
              );
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dua kartu per baris
                childAspectRatio: 0.75, // Rasio aspek untuk menyesuaikan tinggi kartu
                crossAxisSpacing: 8.0, // Spasi antar kolom
                mainAxisSpacing: 8.0, // Spasi antar baris
              ),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                final data = task.data() as Map<String, dynamic>;

                return CustomCard(
                  imageUrl: data['imageUrl'] ?? '',
                  title: data['title'] ?? 'No Title',
                  description: data['description'] ?? 'No Description',
                  price: data['price'] ?? 0.0,
                  onupdate: () {
                    Get.dialog(
                      UpdateTaskDialog(
                        id: task.id,
                        currentTitle: data['title'] ?? '',
                        currentDescription: data['description'] ?? '',
                        currentImageUrl: data['imageUrl'] ?? '',
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
                            'Apakah Anda yakin ingin menghapus data ini?',
                            style: TextStyle(color: Colors.black87),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Menutup dialog
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // Warna tombol biru
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0), // Sudut lebih bulat
                                ),
                                elevation: 5.0, // Menambahkan efek bayangan
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Menyesuaikan padding
                              ),
                              child: const Text(
                                'Batal',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks putih
                                  fontWeight: FontWeight.bold, // Membuat teks lebih tebal
                                ),
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
                                  borderRadius: BorderRadius.circular(8.0), // Sudut lebih bulat
                                ),
                                elevation: 5.0, // Menambahkan efek bayangan
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Menyesuaikan padding
                              ),
                              child: const Text(
                                'Hapus',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks putih
                                  fontWeight: FontWeight.bold, // Membuat teks lebih tebal
                                ),
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
