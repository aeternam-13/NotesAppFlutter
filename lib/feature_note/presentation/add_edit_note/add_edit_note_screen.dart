import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/components/add_edit_note_action.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/components/color_selector.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/transparent_hint_text_field.dart';

class AddEditNoteScreen extends ConsumerWidget {
  const AddEditNoteScreen({super.key});

  void _onUiEvent(BuildContext context, UiEvent event) {
    if (!context.mounted) return;
    switch (event) {
      case SavedNote():
        Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(addEditNoteVMProvider.notifier);
    final state = ref.watch(addEditNoteVMProvider);
    final theme = Theme.of(context);

    ref.listen<AsyncValue<UiEvent>>(noteUiEventProvider, (prev, next) {
      next.whenData((event) => _onUiEvent(context, event));
    });

    return Scaffold(
      floatingActionButton: AddEditNoteAction(
        callback: () => viewmodel.onEvent(SaveNote()),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: Color(state.noteColor),
        child: SafeArea(
          child: Column(
            children: [
              ColorSelector(
                color: state.noteColor,
                setColor:
                    (color) => viewmodel.onEvent(ChangeColor(color: color)),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TransparentHintTextField(
                      text: state.noteTitle.text,
                      hint: state.noteTitle.hint,
                      singleLine: true,
                      textStyle: theme.textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                      onValueChange:
                          (val) => viewmodel.onEvent(EnteredTitle(value: val)),
                    ),
                    SizedBox(height: 8),
                    TransparentHintTextField(
                      text: state.noteContent.text,
                      hint: state.noteContent.hint,
                      textStyle: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                      ),
                      onValueChange:
                          (val) =>
                              viewmodel.onEvent(EnteredContent(value: val)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
