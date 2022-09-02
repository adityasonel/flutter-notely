// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notely/components/folder_list_item.dart';
import 'package:notely/containers/folder_notes.dart';
import 'package:notely/containers/new_note.dart';
import 'package:notely/models/folder.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/components/app_header.dart';
import 'package:notely/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  bool isLoading = true;

  var tempFolders = [
    Folder(
        id: 0,
        title: "personal notes",
        itemCount: 24,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Folder(
        id: 1,
        title: "feelings",
        itemCount: 123,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Folder(
        id: 2,
        title: "morning pages",
        itemCount: 1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Folder(
        id: 3,
        title: "great ideas",
        itemCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Folder(
        id: 4,
        title: "drafts",
        itemCount: 3,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Folder(
        id: 5,
        title: "reminders",
        itemCount: 32,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Folder(
        id: 6,
        title: "todo",
        itemCount: 5,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ];

  onPressFloatingButton(BuildContext context) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => NewNote()));
    Get.to(NewNote());
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.white24,
        ),
      );
    }

    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            floatingActionButton: SizedBox(
              height: 78,
              width: 78,
              child: FloatingActionButton(
                backgroundColor: AppColors.redColor,
                disabledElevation: 0,
                enableFeedback: true,
                splashColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(Utils.appBorderRadius))),
                onPressed: () {
                  onPressFloatingButton(context);
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
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
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: ListView.separated(
                          itemCount: tempFolders.length,
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            final item = tempFolders[index];

                            return FolderListItem(
                                folder: item,
                                onPress: () => Get.to(
                                      FolderNotes(folder: item),
                                    ));
                          }),
                    ),
                  )
                ],
              ),
            )));
  }
}
