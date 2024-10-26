import 'package:flutter/material.dart';
import 'package:food_recipe_guide/screens/categories_screen.dart';
import 'package:food_recipe_guide/screens/dashboard_screen.dart';
import 'package:food_recipe_guide/screens/recipe_list_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _recipes = [
    {
      'title': 'Chicken Curry',
      'description': 'Spicy chicken curry with rice.',
      'ingredients': '1 kg Chicken, 2 cups Rice, Spices to taste',
      'instructions':
          '1. Marinate the chicken.\n2. Cook rice.\n3. Combine and serve.',
    },
    {
      'title': 'Pasta Primavera',
      'description': 'Vegetable pasta with fresh herbs.',
      'ingredients': 'Pasta, Vegetables, Fresh herbs',
      'instructions':
          '1. Cook pasta.\n2. Sauté vegetables.\n3. Combine and serve.',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addOrEditRecipe(Map<String, String>? recipe, {int? index}) async {
    final newRecipe = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(
          action: index == null ? 'add' : 'edit',
          recipe: recipe,
          onSave: (Map<String, String> savedRecipe) {
            setState(() {
              if (index != null) {
                _recipes[index] = savedRecipe; // Update existing recipe
              } else {
                _recipes.add(savedRecipe); // Add new recipe
                Navigator.pop(context);
              }
            });
          },
        ),
      ),
    );

    if (newRecipe != null) {
      setState(() {
        if (index != null) {
          _recipes[index] = newRecipe;
        } else {
          _recipes.add(newRecipe);
        }
      });
    }
  }

  void _deleteRecipe(int index) {
    setState(() {
      _recipes.removeAt(index);
    });
  }

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return RecipeListPage(
          recipes: _recipes,
          onEditRecipe: (recipe, index) =>
              _addOrEditRecipe(recipe, index: index),
          onDeleteRecipe: (index) => _deleteRecipe(index),
        );
      case 1:
        return CategoriesPage();
      case 2:
        return DashboardScreen(
          action: 'add',
          onSave: (newRecipe) => _addOrEditRecipe(newRecipe),
        );
      default:
        return RecipeListPage(
          recipes: _recipes,
          onEditRecipe: (recipe, index) =>
              _addOrEditRecipe(recipe, index: index),
          onDeleteRecipe: (index) => _deleteRecipe(index),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Recipes',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Recipe',
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}
