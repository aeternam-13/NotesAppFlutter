import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';

class ColorSelector extends ConsumerWidget {
  const ColorSelector({super.key, required this.color, required this.setColor});

  final Function(int) setColor;
  final int color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(Note.noteColors.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => setColor(Note.noteColors[index].toARGB32()),
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(45),
                        spreadRadius: 1,
                        blurRadius: 10,
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
      ),
    );
  }
}
