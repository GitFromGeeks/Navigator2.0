import 'package:declarative_navigation/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final ValueChanged<Recipe> onTap;

  RecipeListScreen({
    required this.recipes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView(
        children: [
          for (var recipe in recipes)
            ListTile(
              title: Text(recipe.name),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(recipe.catagory),
                  Text(recipe.chef),
                ],
              ),
              onTap: () => onTap(recipe),
            )
        ],
      ),
    );
  }
}
