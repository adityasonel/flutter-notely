import 'package:notely/models/app_state.dart';
import 'package:notely/reducers/test_reducers.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    notes: notes(state.notes, action),
  );
}
