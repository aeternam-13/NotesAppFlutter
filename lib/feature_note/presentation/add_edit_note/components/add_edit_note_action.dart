import 'package:flutter/material.dart';

class AddEditNoteAction extends StatelessWidget {
  const AddEditNoteAction({super.key, required this.callback});
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: callback, child: Icon(Icons.save));
  }
}
