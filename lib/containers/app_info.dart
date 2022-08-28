import 'package:flutter/material.dart';
import 'package:notely/components/app_header.dart';
import 'package:notely/utils/app_colors.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: Column(
              children: [
                AppHeader(
                  title: "application info",
                  shouldShowBackButton: true,
                  shouldShowSettingButton: false,
                )
              ],
            )));
  }
}
