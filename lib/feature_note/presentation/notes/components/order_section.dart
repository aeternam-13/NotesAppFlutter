import 'package:flutter/material.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/order_type.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/animated_visibility.dart';
import 'package:notesappflutter/feature_note/presentation/notes/components/default_radio_button.dart';

class OrderSection extends StatelessWidget {
  const OrderSection({
    super.key,
    this.noteOrder = const NoteOrderDate(Descending()),
    required this.onOrderChange,
    required this.isVisible,
  });

  final NoteOrder noteOrder;
  final Function(NoteOrder) onOrderChange;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return AnimatedVisibility(
      isVisible: isVisible,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          spacing: 16,
          children: [
            Row(
              children: [
                DefaultRadioButton(
                  text: "Date",
                  selected: noteOrder is NoteOrderDate,
                  onSelect:
                      () => onOrderChange(NoteOrderDate(noteOrder.orderType)),
                ),

                DefaultRadioButton(
                  text: "Title",
                  selected: noteOrder is NoteOrderTitle,
                  onSelect:
                      () => onOrderChange(NoteOrderTitle(noteOrder.orderType)),
                ),

                DefaultRadioButton(
                  text: "Color",
                  selected: noteOrder is NoteOrderColor,
                  onSelect:
                      () => onOrderChange(NoteOrderColor(noteOrder.orderType)),
                ),
              ],
            ),
            Row(
              children: [
                DefaultRadioButton(
                  text: 'Ascending',
                  selected: noteOrder.orderType is Ascending,
                  onSelect: () => onOrderChange(noteOrder.copy(Ascending())),
                ),
                DefaultRadioButton(
                  text: 'Descending',
                  selected: noteOrder.orderType is Descending,
                  onSelect: () => onOrderChange(noteOrder.copy(Descending())),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
