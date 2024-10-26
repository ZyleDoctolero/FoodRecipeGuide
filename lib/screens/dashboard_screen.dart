import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String action;
  final Map<String, String>? recipe;
  final void Function(Map<String, String>)
      onSave; // Function signature for onSave

  DashboardScreen({
    required this.action,
    this.recipe,
    required this.onSave,
  });

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (recipe != null) {
      titleController.text = recipe!['title']!;
      descriptionController.text = recipe!['description']!;
      ingredientsController.text = recipe!['ingredients']!;
      instructionsController.text = recipe!['instructions']!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(action == 'add' ? 'Add Recipe' : 'Edit Recipe'),
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
            TextField(
              controller: ingredientsController,
              decoration: const InputDecoration(labelText: 'Ingredients'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: instructionsController,
              decoration: const InputDecoration(labelText: 'Instructions'),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newRecipe = {
                  'title': titleController.text,
                  'description': descriptionController.text,
                  'ingredients': ingredientsController.text,
                  'instructions': instructionsController.text,
                };
                onSave(newRecipe); // Call onSave with the new recipe
                Navigator.pop(context); // Pop back to the previous screen
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
