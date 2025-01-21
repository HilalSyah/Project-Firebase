import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final tasksCollection = FirebaseFirestore.instance.collection('tasks');

  // Stream untuk mendapatkan data dari Firestore
  Stream<QuerySnapshot> get tasksStream => tasksCollection.snapshots();

  // Tambah data ke Firestore
  void addTask(
      String title, String description, String imageUrl, double price) {
    tasksCollection.add({
      'title': title.isEmpty ? 'Untitled' : title,
      'description': description.isEmpty ? 'No description' : description,
      'imageUrl': imageUrl.isEmpty ? '' : imageUrl,
      'price': price,
    }).then((value) {
      print("Task Added: ${value.id}");
    }).catchError((error) {
      print("Failed to add task: $error");
    });
  }

  // Perbarui data di Firestore
  void updateTask(
      String id, String title, String description, String imageUrl) {
    tasksCollection.doc(id).update({
      'title': title.isEmpty ? 'Untitled' : title,
      'description': description.isEmpty ? 'No description' : description,
      'imageUrl': imageUrl.isEmpty ? '' : imageUrl,
    });
  }

  // Hapus data dari Firestore
  void deleteTask(String id) {
    tasksCollection.doc(id).delete();
  }
}
