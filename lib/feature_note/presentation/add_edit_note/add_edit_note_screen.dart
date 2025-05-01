import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';

import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/components/add_edit_note_action.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/components/color_selector.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/transparent_hint_text_field.dart';
import 'package:notesappflutter/feature_note/presentation/common_components/inmutable_text.dart';

class AddEditNoteScreen extends ConsumerStatefulWidget {
  const AddEditNoteScreen({super.key, this.noteId = -1});

  final int noteId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends ConsumerState<AddEditNoteScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(addEditNoteVMProvider.notifier).loadNote(widget.noteId);
  }

  void _onUiEvent(UiEvent event) {
    if (!mounted) return;
    switch (event) {
      case SavedNote():
        Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.read(addEditNoteVMProvider.notifier);
    final state = ref.watch(addEditNoteVMProvider);
    ref.listen<AsyncValue<UiEvent>>(noteUiEventProvider, (prev, next) {
      next.whenData(_onUiEvent);
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TransparentHintTextField(
                        text: state.noteTitle.text,
                        hint: state.noteTitle.hint,
                        singleLine: true,
                        textStyle: InmutableStyle.titleLargeLargeBlack(context),
                        onValueChange:
                            (val) =>
                                viewmodel.onEvent(EnteredTitle(value: val)),
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: TransparentHintTextField(
                          text: state.noteContent.text,
                          hint: state.noteContent.hint,
                          textStyle: InmutableStyle.bodyLargeBlack(context),
                          onValueChange:
                              (val) =>
                                  viewmodel.onEvent(EnteredContent(value: val)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
