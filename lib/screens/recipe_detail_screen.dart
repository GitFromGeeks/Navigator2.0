import 'package:declarative_navigation/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  Recipe recipe;

  RecipeDetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (recipe != null) ...[
              Text(recipe.name, style: Theme.of(context).textTheme.headline3),
              Text(recipe.catagory,
                  style: Theme.of(context).textTheme.subtitle1),
              Text(recipe.chef, style: Theme.of(context).textTheme.subtitle2)
            ]
          ],
        ),
      ),
    );
  }
}
