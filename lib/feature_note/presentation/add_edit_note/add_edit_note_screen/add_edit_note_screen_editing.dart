import 'package:flutter/widgets.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state_holder.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/components/color_selector.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/note_text_field/transparent_hint_text_field.dart';
import 'package:notesappflutter/feature_note/presentation/common_components/inmutable_text.dart';

class AddEditNoteScreenEditing extends StatelessWidget {
  const AddEditNoteScreenEditing({
    super.key,
    required this.stateHolder,
    required this.changeColor,
    required this.onTitleChange,
    required this.onContentChange,
  });

  final AddEditNoteStateHolder stateHolder;
  final Function(int) changeColor;
  final Function(String) onTitleChange;
  final Function(String) onContentChange;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: Color(stateHolder.noteColor),
      child: SafeArea(
        child: Column(
          children: [
            ColorSelector(
              color: stateHolder.noteColor,
              setColor: (color) => changeColor(color),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TransparentHintTextField(
                      text: stateHolder.noteTitle.text,
                      hint: stateHolder.noteTitle.hint,
                      singleLine: true,
                      textStyle: InmutableStyle.titleLargeLargeBlack(context),
                      onValueChange: onTitleChange,
                    ),
                    SizedBox(height: 8),
                    Flexible(
                      child: TransparentHintTextField(
                        text: stateHolder.noteContent.text,
                        hint: stateHolder.noteContent.hint,
                        textStyle: InmutableStyle.bodyLargeBlack(context),
                        onValueChange: onContentChange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
