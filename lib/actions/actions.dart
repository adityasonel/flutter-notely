import 'package:notely/models/note.dart';

enum NoteAction { add, update, trash }

class TestAction {
  NoteAction noteAction;
  Note note;

  TestAction(this.noteAction, this.note);
}
