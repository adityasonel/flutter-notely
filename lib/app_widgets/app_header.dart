// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notely/pages/settings.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/utils/utils.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Settings()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: shouldShowBackButton ? 0 : 64, minWidth: double.infinity),
      child: Container(
        color: AppColors.blackColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            shouldShowBackButton
                ? IconButton(
                    onPressed: () {
                      onBackButtonPressed(context);
                    },
                    icon: const Icon(Icons.keyboard_backspace_rounded,
                        color: AppColors.whiteColor))
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(title.isNotEmpty ? title : "notely",
                      style: TextStyle(
                          fontFamily: Utils.appFontFamily,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 41)),
                ),
                shouldShowSettingButton
                    ? IconButton(
                        onPressed: () {
                          onSettingButtonPressed(context);
                        },
                        icon: Icon(
                          Icons.settings,
                          color: AppColors.whiteColor,
                        ))
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
