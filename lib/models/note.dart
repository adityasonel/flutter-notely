class Note {
  final int _id;
  final String _title;
  final String _text;
  final String _folder;
  final DateTime _createdAt;
  final DateTime _updatedAt;

  int get id => _id;
  String get title => _title;
  String get text => _text;
  String get folder => _folder;
  DateTime get createdAt => _createdAt;
  DateTime get updatedAt => _updatedAt;

  Note(this._id, this._title, this._text, this._folder, this._createdAt,
      this._updatedAt);

  Note.initialState()
      : _id = -1,
        _title = "",
        _text = "",
        _folder = "",
        _createdAt = DateTime.now(),
        _updatedAt = DateTime.now();

  @override
  String toString() {
    return "id: $_id; title: $_title; text: $_text; folder: $_folder; createdAt: $_createdAt; updatedAt: $updatedAt";
  }
}
