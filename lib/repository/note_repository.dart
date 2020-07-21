import 'package:notes_flutter_app/dao/note_dao.dart';
import 'package:notes_flutter_app/model/notes.dart';

class NotesRepository {
  final notesDao = new NotesDao();

  Future getAllNotes({String query}) => notesDao.getNotes(query: query);
  Future insertNote(Note note) => notesDao.createNote(note);
  Future updateNode(Note note) => notesDao.updateNote(note);
  Future delteNoteById(int id) => notesDao.deleteNote(id);
  Future deleteAllNotes() => notesDao.deleteNotes();
}
