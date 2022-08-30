import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:notely/models/note.dart';

@immutable
class AppState {
  final List<Note> notes;

  const AppState({required this.notes});

  AppState copyWith({required List<Note> notes}) => AppState(notes: notes);

  static AppState fromJson(dynamic json) {
    print("fromJson");
    return AppState(notes: json != null ? json["notes"] : []);
  }

  dynamic toJson() {
    print("toJson");
    return jsonEncode({notes: notes});
  }
}
