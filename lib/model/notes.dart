class Note {
  int id;
  String description;

  Note({this.id, this.description});

  factory Note.fromDatabaseJson(
    Map <String, dynamic> data
  ) => Note(
    id: data['id'],
    description: data['description'],
  );

  Map <String, dynamic> toDatabaseJson() => {
    "id": this.id,
    "description": this.description
  };
}
