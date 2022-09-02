// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notely/containers/settings.dart';
import 'package:notely/utils/app_colors.dart';

class AppHeader extends StatelessWidget {
  bool shouldShowBackButton = false;
  bool shouldShowSettingButton = false;
  String title;

  AppHeader(
      {super.key,
      required this.shouldShowBackButton,
      required this.shouldShowSettingButton,
      required this.title});

  void onBackButtonPressed(BuildContext context) {
    Navigator.pop(context);
  }

  void onSettingButtonPressed(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Settings()),
    // );
    Get.to(Settings());
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 91, minWidth: double.infinity),
      child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    shouldShowBackButton
                        ? Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  onBackButtonPressed(context);
                                },
                                icon: const Icon(
                                    Icons.keyboard_backspace_rounded,
                                    color: Colors.white)),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: shouldShowBackButton ? 16.0 : 0.0),
                      child: Text(title.isNotEmpty ? title : "notely",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 41)),
                    )
                  ],
                ),
                shouldShowSettingButton
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30),
                        ),
                        child: IconButton(
                            onPressed: () {
                              onSettingButtonPressed(context);
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            )),
                      )
                    : Container()
              ],
            ),
          )),
    );
  }
}
