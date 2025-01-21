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
      title: const Text('Add Task'),
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
          TextField(
            controller: priceController,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
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
          child: const Text('Add'),
        ),
      ],
    );
  }
}
