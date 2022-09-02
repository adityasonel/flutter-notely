// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
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

class Settings extends StatelessWidget {
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

  final actions = {
    app_enums.Settings.TRASH: Trash(),
    app_enums.Settings.APPLICATION_INFO: AppInfo()
  };

  Settings({super.key});

  Dialog factDialog(context, value) {
    final dialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Utils.appBorderRadius)),
      child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 180.0,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    value,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("Close",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ))
              ],
            ),
          )),
    );

    return dialog;
  }

  void onPressSettings(BuildContext context, String key) async {
    debugPrint(key);
    final action = actions[key];

    if (key == app_enums.Settings.AN_NORRIS_FACT.name) {
      try {
        Utils.toast(context: context, text: "Fetching...");
        Fact fact = await Requests.getFact();
        debugPrint("completed - fact - ${fact.value}");
        showDialog(
            context: context,
            builder: (BuildContext context) => factDialog(context, fact.value));
      } on Exception catch (error) {
        Utils.toast(
            context: context,
            text: error.toString(),
            type: app_enums.SnackbarTypes.ERROR);
      }
    } else if (key == app_enums.Settings.TRASH.name ||
        key == app_enums.Settings.ABOUT_DEVELOPER.name) {
      if (action != null) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => action),
        // );
        Get.to(action);
      }
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
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: settings.length,
                    itemBuilder: (BuildContext context, int index) {
                      final keys = settings.keys.toList();

                      final key = keys[index];
                      final icon = settings[keys[index]];

                      return SettingListItem(
                        index: index,
                        title: key.name,
                        icon: icon,
                        onPress: (context, title) =>
                            onPressSettings(context, title),
                      );
                      // buildSettingItem(context, index);
                    },
                  ),
                ))
              ],
            )));
  }
}
