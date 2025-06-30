import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_intent.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen/add_edit_note_screen_editing.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_screen/add_edit_note_screen_loading.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/components/add_edit_note_action.dart';
import 'package:notesappflutter/feature_note/presentation/common_components/snackbar_error.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addEditNoteVMProvider.notifier).loadNote(widget.noteId);
    });
  }

  void _onUiEvent(AddEditNoteUiEvent event) {
    if (!mounted) return;
    switch (event) {
      case SavedNote():
        Navigator.of(context).pop();
      case ShowSnackBar():
        showSnackBarError(context, event.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = ref.read(addEditNoteVMProvider.notifier);

    final state = ref.watch(addEditNoteVMProvider);
    ref.listen<AsyncValue<AddEditNoteUiEvent>>(addEditNoteUiEventProvider, (
      prev,
      next,
    ) {
      next.whenData(_onUiEvent);
    });

    return Scaffold(
      floatingActionButton:
          state is EditingNoteState
              ? AddEditNoteAction(
                callback: () => viewmodel.onIntent(SaveNoteIntent()),
              )
              : null,
      body: switch (state) {
        EditingNoteState() => AddEditNoteScreenEditing(
          stateHolder: state.stateHolder,
          changeColor:
              (color) =>
                  viewmodel.onIntent(ChangeNoteColorIntent(color: color)),
          onTitleChange:
              (val) => viewmodel.onIntent(EnteredTitleIntent(value: val)),
          onContentChange:
              (val) => viewmodel.onIntent(EnteredContentIntent(value: val)),
        ),

        AddEditNoteLoadingState() => AddEditNoteScreenLoading(),
      },
    );
  }
}
