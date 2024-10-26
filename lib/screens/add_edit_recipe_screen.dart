import 'package:flutter/material.dart';

class AddEditRecipeScreen extends StatelessWidget {
  final Map<String, String>? recipe;
  final Function(Map<String, String>) onSave;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddEditRecipeScreen({Key? key, this.recipe, required this.onSave})
      : super(key: key) {
    if (recipe != null) {
      titleController.text = recipe!['title']!;
      descriptionController.text = recipe!['description']!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe == null ? 'Add Recipe' : 'Edit Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Recipe Title'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newRecipe = {
                  'title': titleController.text,
                  'description': descriptionController.text,
                };
                onSave(newRecipe);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
