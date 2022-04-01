import 'package:declarative_navigation/router/RecipeRouteInformationParser.dart';
import 'package:declarative_navigation/router/recipeRouteDelegate.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final RecipeRouteDelegate _recipeRouteDelegate = RecipeRouteDelegate();
  final RecipeRouteInformationParser _informationParser =
      RecipeRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Nested Route',
      routeInformationParser: _informationParser,
      routerDelegate: _recipeRouteDelegate,
    );
  }
}
