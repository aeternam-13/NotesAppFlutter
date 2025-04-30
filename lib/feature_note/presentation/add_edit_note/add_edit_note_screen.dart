import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/transparent_hint_text_field.dart';
import 'package:notesappflutter/feature_note/presentation/safe_scope.dart';

class AddEditNoteScreen extends ConsumerWidget {
  const AddEditNoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(addEditNoteVMProvider.notifier);
    final state = ref.watch(addEditNoteVMProvider);

    return SafeScope(
      floatingButton: AddEditNoteAction(callback: () => {}),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Add edit note screen"),
            TransparentHintTextField(
              text: state.noteTitle.text,
              hint: state.noteTitle.hint,
              singleLine: true,
              onValueChange:
                  (val) => viewmodel.onEvent(EnteredTitle(value: val)),
            ),
            SizedBox(height: 8),
            TransparentHintTextField(
              text: state.noteContent.text,
              hint: state.noteContent.hint,
              onValueChange:
                  (val) => viewmodel.onEvent(EnteredContent(value: val)),
            ),
          ],
        ),
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
