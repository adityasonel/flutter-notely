// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notely/containers/folder_notes.dart';
import 'package:notely/containers/new_note.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/components/app_header.dart';
import 'package:notely/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class TempFolder {
  String name;
  String count;

  TempFolder({required this.name, required this.count});
}

class _Home extends State<Home> {
  bool isLoading = true;

  var tempFolders = [
    TempFolder(name: "personal notes", count: "24"),
    TempFolder(name: "feelings", count: "123"),
    TempFolder(name: "morning pages", count: "1"),
    TempFolder(name: "great ideas", count: "0"),
    TempFolder(name: "drafts", count: "3"),
    TempFolder(name: "reminders", count: "32"),
    TempFolder(name: "todo", count: "54")
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
          color: Colors.white,
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
                  color: AppColors.whiteColor,
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

                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => FolderNotes()));
                                Get.to(FolderNotes());
                              },
                              child: Container(
                                height: 158,
                                decoration: BoxDecoration(
                                    color: Colors.white10,
                                    borderRadius: BorderRadius.circular(
                                        Utils.appBorderRadius)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 16, right: 8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            item.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white70,
                                                fontSize: 15),
                                          ),
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            size: 32,
                                            color: Colors.white70,
                                          )
                                        ],
                                      ),
                                      Text(item.count,
                                          style: TextStyle(
                                              fontSize: 70,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            )));
  }
}
