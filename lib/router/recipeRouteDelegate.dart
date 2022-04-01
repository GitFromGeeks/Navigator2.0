import 'package:declarative_navigation/AppShell.dart';
import 'package:declarative_navigation/router/recipeDetailsPath.dart';
import 'package:declarative_navigation/router/recipeListPath.dart';
import 'package:declarative_navigation/router/recipeRoutePath.dart';
import 'package:declarative_navigation/router/recipeSettingPath.dart';
import 'package:declarative_navigation/state/cakeRecipeState.dart';
import 'package:flutter/material.dart';

class RecipeRouteDelegate extends RouterDelegate<RecipeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecipeRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  // get app state instance
  CakeRecipeState appState = CakeRecipeState();

  RecipeRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(notifyListeners);
  }

  @override
  Future<void> setNewRoutePath(RecipeRoutePath config) async {
    if (config is RecipeListPath) {
      // homeScreen
      appState.selectedIndex = 0;
      appState.selectedRecipe;
    } else if (config is RecipeDetailsPath) {
      // nested home/ details screen
      appState.setSelectedRecipeById(config.id);
    } else if (config is RecipeSettingPath) {
      // setting screen
      appState.selectedIndex = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (appState.selectedRecipe != null) {
          appState.selectedRecipe;
        }
        notifyListeners();
        return true;
      },
      pages: [
        MaterialPage(
          child: AppShell(appState: appState), // appShell
        ),
      ],
    );
  }

  RecipeRoutePath get currentConfig {
    if (appState.selectedIndex == 1) {
      return RecipeSettingPath();
    } else {
      if (appState.selectedRecipe == null) {
        return RecipeListPath();
      } else {
        return RecipeDetailsPath(appState.getSelectedRecipeById());
      }
    }
  }
}
