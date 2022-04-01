import 'package:declarative_navigation/router/recipeDetailsPath.dart';
import 'package:declarative_navigation/router/recipeListPath.dart';
import 'package:declarative_navigation/router/recipeRoutePath.dart';
import 'package:declarative_navigation/router/recipeSettingPath.dart';
import 'package:flutter/cupertino.dart';

class RecipeRouteInformationParser
    extends RouteInformationParser<RecipeRoutePath> {
  @override
  Future<RecipeRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'settings') {
      return RecipeSettingPath();
    } else {
      if (uri.pathSegments.length >= 2) {
        if (uri.pathSegments[0] == 'recipe') {
          return RecipeDetailsPath(int.tryParse(uri.pathSegments[1])!);
        }
      }
      return RecipeListPath();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RecipeRoutePath config) {
    if (config is RecipeListPath) {
      return const RouteInformation(location: '/home');
    }
    if (config is RecipeDetailsPath) {
      return RouteInformation(location: '/recipe/${config.id}');
    }
    if (config is RecipeSettingPath) {
      return const RouteInformation(location: '/settings');
    }
    return null;
  }
}
