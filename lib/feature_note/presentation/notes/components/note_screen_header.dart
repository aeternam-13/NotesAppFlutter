import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/di/providers.dart';
import 'package:notesappflutter/feature_note/domain/model/storage_mode.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_intent.dart';

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

        Row(
          children: [
            IconButton(
              onPressed:
                  () => viewmodel.onIntent(
                    SwitchStorageModeIntent(
                      viewmodel.storageMode == StorageMode.api
                          ? StorageMode.hive
                          : StorageMode.api,
                    ),
                  ),
              icon: Icon(
                viewmodel.storageMode == StorageMode.api
                    ? Icons.network_wifi_2_bar_outlined
                    : Icons.hive,
              ),
            ),
            IconButton(
              onPressed: () => viewmodel.onIntent(ToggleOrderSectionIntent()),
              icon: Icon(Icons.settings, size: 32),
            ),
          ],
        ),
      ],
    );
  }
}
