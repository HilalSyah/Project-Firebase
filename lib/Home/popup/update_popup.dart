import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';


class UpdateTaskDialog extends StatelessWidget {
  final String id;
  final String currentTitle;
  final String currentDescription;
  final String currentImageUrl;

  UpdateTaskDialog({
    Key? key,
    required this.id,
    required this.currentTitle,
    required this.currentDescription,
    required this.currentImageUrl,
  }) : super(key: key);

  final HomeController controller = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers dengan nilai saat ini
    titleController.text = currentTitle;
    descriptionController.text = currentDescription;
    imageUrlController.text = currentImageUrl;

    return AlertDialog(
      title: const Text('Update Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          TextField(
            controller: imageUrlController,
            decoration: const InputDecoration(labelText: 'Image URL'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.updateTask(
              id,
              titleController.text,
              descriptionController.text,
              imageUrlController.text,
            );
            Get.back(); // Menutup dialog
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
