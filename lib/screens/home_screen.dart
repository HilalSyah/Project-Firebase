import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller = Get.put(HomeController());
  final CollectionReference tasksCollection =
  FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Firebase'),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/profile'); // Navigasi ke halaman profile
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: tasksCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              final data = task.data() as Map<String, dynamic>; // Konversi ke Map

              return ListTile(
                leading: data['imageUrl'] != null && data['imageUrl'].isNotEmpty
                    ? Image.network(
                  data['imageUrl'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                    : Icon(Icons.image_not_supported, size: 50),
                title: Text(data['title'] ?? 'No Title'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['description'] ?? 'No Description'),
                    if (data['imageUrl'] != null && data['imageUrl'].isNotEmpty)
                      Text(
                        data['imageUrl'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _showUpdateDialog(
                          context,
                          task.id,
                          data['title'] ?? '',
                          data['description'] ?? '',
                          data['imageUrl'] ?? '',
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        tasksCollection.doc(task.id).delete();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController imageUrlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              tasksCollection.add({
                'title': titleController.text.isEmpty
                    ? 'Untitled'
                    : titleController.text,
                'description': descriptionController.text.isEmpty
                    ? 'No description'
                    : descriptionController.text,
                'imageUrl': imageUrlController.text.isEmpty
                    ? ''
                    : imageUrlController.text, // Default: empty string
              });
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, String id, String currentTitle,
      String currentDescription, String currentImageUrl) {
    final TextEditingController titleController =
    TextEditingController(text: currentTitle);
    final TextEditingController descriptionController =
    TextEditingController(text: currentDescription);
    final TextEditingController imageUrlController =
    TextEditingController(text: currentImageUrl);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              tasksCollection.doc(id).update({
                'title': titleController.text.isEmpty
                    ? 'Untitled'
                    : titleController.text,
                'description': descriptionController.text.isEmpty
                    ? 'No description'
                    : descriptionController.text,
                'imageUrl': imageUrlController.text.isEmpty
                    ? ''
                    : imageUrlController.text, // Default: empty string
              });
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
