import 'package:notes_flutter_app/model/notes.dart';
import 'package:notes_flutter_app/repository/note_repository.dart';

import 'dart:async';

class NotesBloc {
  final _notesRepository = NotesRepository();
  final _notesController = StreamController<List<Note>>.broadcast();

  get notes => _notesController.stream;

  NotesBloc() {
    getNotes();
  }

  getNotes({String query}) async {
    _notesController.sink.add(
      await _notesRepository.getAllNotes(query: query)
    );
  }

  addNote(Note note) async {
    await _notesRepository.insertNote(note);
    getNotes();
  }

  updateNote(Note note) async {
    await _notesRepository.updateNode(note);
    getNotes();
  }

  deleteToDoById(int id) async {
    _notesRepository.delteNoteById(id);
    getNotes();
  }

  dispose() {
    _notesController.close();
  }
}