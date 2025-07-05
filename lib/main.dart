import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_screen/notes_screen.dart';
import 'package:notesappflutter/hive/hive_registrar.g.dart';
import 'package:notesappflutter/theme.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && !kIsWasm) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapters();
    await Hive.openBox('notesBox');
  }
  runApp(ProviderScope(child: const NotesAppFlutter()));
}

class NotesAppFlutter extends StatefulWidget {
  const NotesAppFlutter({super.key});

  @override
  State<NotesAppFlutter> createState() => _NotesAppFlutterState();
}

class _NotesAppFlutterState extends State<NotesAppFlutter> {
  final _appTheme = MaterialTheme(ThemeData.light().textTheme);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: _appTheme.light(),
      darkTheme: _appTheme.dark(),
      highContrastDarkTheme: _appTheme.darkHighContrast(),
      highContrastTheme: _appTheme.lightHighContrast(),
      themeMode: ThemeMode.system,
      home: const NotesScreen(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
