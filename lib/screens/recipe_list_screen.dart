import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

class RecipeListPage extends StatelessWidget {
  final List<Map<String, String>> recipes;
  final void Function(Map<String, String>, int) onEditRecipe;
  final void Function(int) onDeleteRecipe;

  RecipeListPage({
    required this.recipes,
    required this.onEditRecipe,
    required this.onDeleteRecipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['title']!),
            subtitle: Text(recipes[index]['description']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RecipeDetailPage(recipe: recipes[index]),
                ),
              );
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => onEditRecipe(recipes[index], index),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => onDeleteRecipe(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
