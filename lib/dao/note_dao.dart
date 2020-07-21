import 'dart:async';
import 'package:notes_flutter_app/database/database.dart';
import 'package:notes_flutter_app/model/notes.dart';

class NotesDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future <int> createNote (Note note) async {
    final db = await dbProvider.database;
    var result = db.insert(notesTable, note.toDatabaseJson());
    return result;
  }

  Future <List<Note>> getNotes({List <String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty){
        result = await db.query(
          notesTable,
          columns: columns,
          where: 'description LIKE ?',
          whereArgs: ["%$query%"]
        );
      }
    }
    else{
      print (db);
      result = await db.query(
        notesTable,
        columns: columns
      );
    }
    List<Note> notes = result.isNotEmpty ? result.map((item) => Note.fromDatabaseJson(item)).toList() : [];
    return notes;
  }

  Future <int> updateNote (Note note) async {
    final db = await dbProvider.database;

    var result = await db.update(
      notesTable,
      note.toDatabaseJson(),
      where: "id = ?",
      whereArgs: [note.id]
    );
    return result;
  }

  Future <int> deleteNote (int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(
      notesTable,
      where: "id = ?",
      whereArgs: [id]
    );
    return result;
  }

  Future deleteNotes() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      notesTable,
    );
    return result;
  }
}
