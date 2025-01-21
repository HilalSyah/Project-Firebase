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
        title: const Text('CRUD Firebase'),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/profile');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.tasksStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              final data = task.data() as Map<String, dynamic>;

              return CustomCard(
                title: data['title'] ?? 'No Title',
                description: data['description'] ?? 'No Description',
                imageUrl: data['imageUrl'] ?? '',
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
                onDelete: () => controller.deleteTask(task.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.dialog(AddTaskDialog()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
