// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notely/components/fact_dialog.dart';
import 'package:notely/components/setting_list_item.dart';
import 'package:notely/containers/app_info.dart';
import 'package:notely/containers/trash.dart';
import 'package:notely/http/requests.dart';
import 'package:notely/models/fact.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/components/app_header.dart';
import 'package:notely/utils/enums.dart' as app_enums;
import 'package:notely/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class Settings extends StatefulWidget {
  final settings = {
    app_enums.Settings.AN_NORRIS_FACT: Icons.local_fire_department_sharp,
    app_enums.Settings.TRASH: Icons.archive_outlined,
    app_enums.Settings.SHARE: Icons.share_rounded,
    app_enums.Settings.SUPPORT: Icons.contact_support_rounded,
    app_enums.Settings.APPLICATION_INFO: Icons.info_outline,
    app_enums.Settings.ABOUT_DEVELOPER: Icons.account_circle_outlined
    // app_enums.Settings.RATING: Icons.rate_review_rounded,
    // app_enums.Settings.LOGOUT: Icons.logout_rounded
  };

  Settings({super.key});

  @override
  State<StatefulWidget> createState() => _Settings();
}

class _Settings extends State<Settings> {
  int loadingIndex = -1;

  void onPressSettings(BuildContext context, String key, int index) async {
    if (key == app_enums.Settings.AN_NORRIS_FACT.name) {
      try {
        setState(() {
          loadingIndex = 0;
        });
        Utils.toast(context: context, text: "Fetching...");
        Fact fact = await Requests.getFact();
        debugPrint("completed - fact - ${fact.value}");
        showDialog(
            context: context,
            builder: (BuildContext context) => FactDialog(value: fact.value));

        setState(() {
          loadingIndex = -1;
        });
      } on Exception catch (error) {
        setState(() {
          loadingIndex = -1;
        });
        Utils.toast(
            context: context,
            text: error.toString(),
            type: app_enums.SnackbarTypes.ERROR);
      }
    } else if (key == app_enums.Settings.TRASH.name) {
      Get.to(Trash());
    } else if (key == app_enums.Settings.SHARE.name) {
      Share.share(
          "hey, notely is an awesome notes application build on flutter. check it out here: https://adityasonel.github.io");
    } else if (key == app_enums.Settings.SUPPORT.name) {
      const String email = "aditya.sonel@outlook.com";
      const String subject = "hey, notely is awesome";

      final Uri launchUri = Uri(
          scheme: "mailto",
          path: email,
          query: Utils.encodeQueryParameters(<String, String>{
            "subject": subject,
          }));

      if (await canLaunchUrl(launchUri)) {
        launchUrl(launchUri);
      } else {
        Utils.toast(
            context: context, text: "Some error occured, please try again!");
      }
    } else if (key == app_enums.Settings.ABOUT_DEVELOPER.name) {
      final Uri launchUri = Uri(scheme: "https", path: "adityasonel.github.io");

      if (await canLaunchUrl(launchUri)) {
        launchUrl(launchUri);
      } else {
        Utils.toast(
            context: context, text: "Some error occured, please try again!");
      }
    } else if (key == app_enums.Settings.RATING.name) {
      final Uri launchUri = Uri(scheme: "https", path: "adityasonel.github.io");

      if (await canLaunchUrl(launchUri)) {
        launchUrl(launchUri);
      } else {
        Utils.toast(
            context: context, text: "Some error occured, please try again!");
      }
    } else if (key == app_enums.Settings.LOGOUT.name) {
      Utils.toast(
          context: context,
          text: app_enums.Settings.LOGOUT.toString(),
          type: app_enums.SnackbarTypes.ERROR);
    } else if (key == app_enums.Settings.ABOUT_DEVELOPER.name) {
      Get.to(AppInfo());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: Column(
              children: [
                AppHeader(
                  title: "settings",
                  shouldShowBackButton: true,
                  shouldShowSettingButton: false,
                ),
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.only(right: 16, bottom: 16, left: 16, top: 12),
                  child: ListView.builder(
                    itemCount: widget.settings.length,
                    itemBuilder: (BuildContext context, int index) {
                      final keys = widget.settings.keys.toList();

                      final key = keys[index];
                      final icon = widget.settings[keys[index]];

                      return SettingListItem(
                        index: index,
                        title: key.name,
                        icon: icon,
                        loadingIndex: loadingIndex,
                        onPress: (context, title) =>
                            onPressSettings(context, title, index),
                      );
                      // buildSettingItem(context, index);
                    },
                  ),
                ))
              ],
            )));
  }
}
