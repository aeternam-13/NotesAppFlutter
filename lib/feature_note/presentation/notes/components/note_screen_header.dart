import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_event.dart';

class NoteScreenHeader extends ConsumerWidget {
  const NoteScreenHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final viewmodel = ref.read(noteVMProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("NotesApp Flutter", style: theme.textTheme.headlineLarge),
        IconButton(
          onPressed: () => viewmodel.onEvent(EventToggleOrderSection()),
          icon: Icon(Icons.settings, color: theme.primaryColor, size: 32),
        ),
      ],
    );
  }
}
