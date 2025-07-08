import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/storage_mode.dart';

class NoteScreenHeader extends ConsumerWidget {
  const NoteScreenHeader({
    super.key,
    required this.storageMode,
    required this.changeStorageMode,
    required this.toggleOrderSection,
  });

  final StorageMode storageMode;
  final void Function(StorageMode) changeStorageMode;
  final VoidCallback toggleOrderSection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("NotesApp Flutter", style: theme.textTheme.headlineLarge),
        Row(
          children: [
            if (!kIsWeb && !kIsWasm)
              IconButton(
                onPressed:
                    () => changeStorageMode(
                      storageMode == StorageMode.api
                          ? StorageMode.hive
                          : StorageMode.api,
                    ),
                icon: Icon(
                  storageMode == StorageMode.api
                      ? Icons.network_wifi_2_bar_outlined
                      : Icons.hive,
                ),
              ),
            IconButton(
              onPressed: toggleOrderSection,
              icon: Icon(Icons.settings, size: 32),
            ),
          ],
        ),
      ],
    );
  }
}
