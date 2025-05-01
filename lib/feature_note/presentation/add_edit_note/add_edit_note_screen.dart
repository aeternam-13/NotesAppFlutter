import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/transparent_hint_text_field.dart';

class AddEditNoteScreen extends ConsumerWidget {
  const AddEditNoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(addEditNoteVMProvider.notifier);
    final state = ref.watch(addEditNoteVMProvider);
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: AddEditNoteAction(callback: () => {}),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: Color(state.noteColor),
        child: SafeArea(
          child: Column(
            children: [
              ColorSelector(
                color: state.noteColor,
                setColor: (color) {
                  viewmodel.onEvent(ChangeColor(color: color));
                },
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

class ColorSelector extends ConsumerWidget {
  const ColorSelector({super.key, required this.color, required this.setColor});

  final Function(int) setColor;
  final int color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(Note.noteColors.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () => setColor(Note.noteColors[index].toARGB32()),
              child: Container(
                width: 65,
                height: 65,

                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(40),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 0), // vertical shadow
                    ),
                  ],
                  border:
                      color == Note.noteColors[index].toARGB32()
                          ? Border.all(color: Colors.black, width: 4)
                          : null,
                  color: Note.noteColors[index],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          );
        }),
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
