import 'package:flutter/material.dart';
import 'package:notely/components/app_header.dart';
import 'package:notely/utils/app_colors.dart';

class Trash extends StatelessWidget {
  const Trash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: Column(
              children: [
                AppHeader(
                  title: "trash",
                  shouldShowBackButton: true,
                  shouldShowSettingButton: false,
                )
              ],
            )));
  }
}
