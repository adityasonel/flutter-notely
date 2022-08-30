import 'package:notely/actions/actions.dart';
import 'package:notely/models/note.dart';
import 'package:redux/redux.dart';

final notes = TypedReducer(_addNoteReducer);
List<Note> _addNoteReducer(List<Note> state, TestAction action) {
  var list = state.toList();
  switch (action.noteAction) {
    case NoteAction.add:
      list.add(action.note);
      return list;
    case NoteAction.update:
      Note note =
          list.firstWhere((element) => element.title == action.note.title);
      list[list.indexWhere((element) => element.title == note.title)] = note;
      return list;
    case NoteAction.trash:
      Note note =
          list.firstWhere((element) => element.title == action.note.title);
      list.removeAt(list.indexWhere((element) => element.title == note.title));
      return list;
    default:
      return list;
  }
}
