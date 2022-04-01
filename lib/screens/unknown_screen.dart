import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not found'),
      ),
      body: const Center(
        child: Text('This screen is not found, try to hit get back first 😁'),
      ),
    );
  }
}
