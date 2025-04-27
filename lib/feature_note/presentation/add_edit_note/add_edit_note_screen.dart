import 'package:flutter/material.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddEditNoteAction(callback: () => {}),
      body: SafeArea(child: Column(children: [Text("Add edit note screen")])),
    );
  }
}

class AddEditNoteAction extends StatelessWidget {
  const AddEditNoteAction({super.key, required this.callback});
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: callback, child: Icon(Icons.save));
  }
}
