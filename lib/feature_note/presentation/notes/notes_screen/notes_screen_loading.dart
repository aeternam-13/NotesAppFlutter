import 'package:flutter/material.dart';

class NotesScreenLoading extends StatelessWidget {
  const NotesScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Text("Loading notes"), CircularProgressIndicator()],
      ),
    );
  }
}
