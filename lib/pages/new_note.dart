import 'package:flutter/material.dart';
import 'package:notely/app_widgets/app_header.dart';
import 'package:notely/utils/app_colors.dart';

class NewNote extends StatelessWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: Column(
              children: [
                AppHeader(
                  title: "new_note",
                  shouldShowBackButton: true,
                  shouldShowSettingButton: false,
                )
              ],
            )));
  }
}