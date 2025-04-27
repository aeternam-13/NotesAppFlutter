import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Notes App Flutter",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
