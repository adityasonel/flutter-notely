// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:notely/actions/actions.dart';
import 'package:notely/models/app_state.dart';
import 'package:notely/models/note.dart';
import 'package:notely/pages/new_note.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/app_widgets/app_header.dart';
import 'package:notely/utils/utils.dart';
import 'package:redux/redux.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  onPressFloatingButton(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewNote()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: true,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            floatingActionButton: SizedBox(
              height: 78,
              width: 78,
              child: StoreConnector<AppState, List<Note>>(
                converter: (Store<AppState> store) => store.state.notes,
                builder: (BuildContext context, List<Note> notes) {
                  return FloatingActionButton(
                    backgroundColor: AppColors.redColor,
                    disabledElevation: 0,
                    enableFeedback: true,
                    splashColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Utils.appBorderRadius))),
                    onPressed: () {
                      // onPressFloatingButton(context);

                      Note note = Note(
                          notes.length + 1,
                          "Wow",
                          "this is very awesome",
                          "drafts",
                          DateTime.now(),
                          DateTime.now());

                      StoreProvider.of<AppState>(context)
                          .dispatch(TestAction(NoteAction.add, note));
                    },
                    child: Icon(
                      Icons.add,
                      color: AppColors.whiteColor,
                    ),
                  );
                },
              ),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  AppHeader(
                    title: "folders",
                    shouldShowBackButton: false,
                    shouldShowSettingButton: true,
                  ),
                  StoreConnector<AppState, List<Note>>(
                    converter: (Store<AppState> store) => store.state.notes,
                    builder: (BuildContext context, List<Note> note) {
                      var list = <Widget>[];
                      for (var element in note) {
                        list.add(Text(element.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: Utils.appFontFamily,
                                fontSize: 32,
                                fontWeight: FontWeight.bold)));
                      }

                      return Expanded(
                          child: ListView(
                        children: list,
                      ));
                    },
                  )
                ],
              ),
            )));
  }
}
