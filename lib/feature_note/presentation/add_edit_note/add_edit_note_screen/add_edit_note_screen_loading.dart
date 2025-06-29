import 'package:flutter/material.dart';

class AddEditNoteScreenLoading extends StatelessWidget {
  const AddEditNoteScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading..."), CircularProgressIndicator()],
        ),
      ],
    );
  }
}
