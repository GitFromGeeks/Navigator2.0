import 'package:declarative_navigation/screens/fadeAnimationPage.dart';
import 'package:declarative_navigation/screens/recipe_detail_screen.dart';
import 'package:declarative_navigation/screens/recipes_List_screen.dart';
import 'package:declarative_navigation/screens/settingScreen.dart';
import 'package:declarative_navigation/state/cakeRecipeState.dart';
import 'package:flutter/material.dart';
import 'package:declarative_navigation/router/recipeRoutePath.dart';

class InnerRouteDelegate extends RouterDelegate<RecipeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecipeRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  CakeRecipeState _appState;

  CakeRecipeState get appState => _appState;

  set appState(CakeRecipeState newState) {
    if (newState == _appState) {
      return;
    }
    _appState = newState;
    notifyListeners();
  }

  InnerRouteDelegate(this._appState);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      pages: [
        if (appState.selectedIndex == 0) ...[
          FadeAnimationPage(
            child: RecipeListScreen(
              recipes: appState.recipes,
              onTap: (recipe) {
                appState.selectedRecipe = recipe;
                notifyListeners();
              },
            ),
          ),
          if (appState.selectedRecipe != null)
            MaterialPage(
              key: ValueKey(appState.selectedRecipe),
              child: RecipeDetailsScreen(recipe: appState.selectedRecipe),
            )
        ] else
          FadeAnimationPage(
            child: SettingScreen(),
            key: const ValueKey('Setting'),
          )
      ],
      onPopPage: (route, result) {
        appState.selectedRecipe;
        notifyListeners();
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RecipeRoutePath config) async {
    assert(true);
  }
}
