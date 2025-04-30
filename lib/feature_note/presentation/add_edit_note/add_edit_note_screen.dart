import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/transparent_hint_text_field.dart';
import 'package:notesappflutter/feature_note/presentation/safe_scope.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    //final viewmodel = ref.read(note.notifier);
    return SafeScope(
      floatingButton: AddEditNoteAction(callback: () => {}),
      child: Column(
        children: [
          Text("Add edit note screen"),
          TransparentHintTextField(
            text: text,
            hint: hint,
            onValueChange: onValueChange,
            onFocusChange: onFocusChange,
          ),
        ],
      ),
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
