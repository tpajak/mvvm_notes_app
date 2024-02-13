import 'package:flutter/material.dart';
import 'package:mvvm_notes_app/config/base/app_config.dart';
import 'package:mvvm_notes_app/models/note.dart';
import 'package:mvvm_notes_app/viewmodels/note_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/environment.dart';

class NoteListView extends StatelessWidget {
  final NotesViewModel _viewModel;

  NoteListView({super.key, required NotesViewModel notesViewModel})
      : _viewModel = notesViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes version ${Environment().config.appVersion} ',

        ),
      ),
      body: BlocBuilder<NotesViewModel, List<Note>>(
        bloc: _viewModel,
        builder: (context, notes) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(notes[index].title, style: Theme.of(context).textTheme.bodyMedium),
                subtitle: Text(notes[index].content, style: Theme.of(context).textTheme.bodySmall,),
                onTap: () {
                  _editNote(context, notes[index], index);
                },
              );
            },
            itemCount: notes.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editNote(BuildContext context, Note note, int index) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String content = '';

        return AlertDialog(
          title: Text('Edit note'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
                controller: TextEditingController(text: title),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
                onChanged: (value) {
                  content = value;
                },
                controller: TextEditingController(text: content),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Note updatedNote = Note(title: title, content: content);
                _viewModel.updateNote(index, updatedNote);
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
            ElevatedButton(
              onPressed: () {
                _viewModel.deleteNote(index);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            )
          ],
        );
      },
    );
  }

  void _addNote(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String content = '';

        return AlertDialog(
          title: const Text('Add note'),
          content: Column(
            children: [
              TextField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  onChanged: (value) {
                    title = value;
                  }),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Content',
                ),
                onChanged: (value) {
                  content = value;
                },
              )
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Note updatedNote = Note(
                    title: title,
                    content: content,
                  );
                  _viewModel.addNote(updatedNote);
                  Navigator.of(context).pop();
                },
                child: const Text('Add Note'))
          ],
        );
      },
    );
  }
}
