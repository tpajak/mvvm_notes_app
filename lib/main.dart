import 'package:flutter/material.dart';
import 'package:mvvm_notes_app/config/environment.dart';
import 'package:mvvm_notes_app/config/theme/app_theme.dart';
import 'package:mvvm_notes_app/viewmodels/note_viewmodel.dart';
import 'package:mvvm_notes_app/views/note_list_view.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() async {
  await Environment().initConfig(const String.fromEnvironment('ENVIRONMENT'));
  getIt.registerSingleton(NotesViewModel());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteListView(
        notesViewModel: getIt(),
      ),
      theme: AppTheme().theme,
    );
  }
}
