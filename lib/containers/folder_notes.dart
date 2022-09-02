import 'package:flutter/material.dart';
import 'package:notely/components/app_header.dart';
import 'package:notely/models/folder.dart';
import 'package:notely/utils/app_colors.dart';

class FolderNotes extends StatelessWidget {
  const FolderNotes({Key? key, required this.folder}) : super(key: key);

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: Column(
              children: [
                AppHeader(
                  title: folder.title,
                  shouldShowBackButton: true,
                  shouldShowSettingButton: false,
                ),
                Text(folder.toString(),
                    style: const TextStyle(color: Colors.amber, fontSize: 32))
              ],
            )));
  }
}
