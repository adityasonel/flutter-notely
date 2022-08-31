// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notely/containers/new_note.dart';
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

  onPressFloatingButton(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewNote()));
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
      return SafeArea(
          child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ));
    }

    return SafeArea(
        bottom: true,
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
                ],
              ),
            )));
  }
}
