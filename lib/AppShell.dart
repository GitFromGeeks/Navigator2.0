import 'package:declarative_navigation/router/innerRouteDelegate.dart';
import 'package:declarative_navigation/state/cakeRecipeState.dart';
import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  CakeRecipeState appState;

  AppShell({required this.appState});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppShell> {
  InnerRouteDelegate? _innerRouteDelegate;
  ChildBackButtonDispatcher? _backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    _innerRouteDelegate = InnerRouteDelegate(widget.appState);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _backButtonDispatcher = Router.of(context)
        .backButtonDispatcher!
        .createChildBackButtonDispatcher();
  }

  @override
  void didUpdateWidget(covariant AppShell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _innerRouteDelegate!.appState = widget.appState;
  }

  @override
  Widget build(BuildContext context) {
    var appState = widget.appState;
    return Scaffold(
      body: Router(
        routerDelegate: _innerRouteDelegate!,
        backButtonDispatcher: _backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: appState.selectedIndex,
        onTap: (inx) {
          appState.selectedIndex = inx;
        },
      ),
    );
  }
}
