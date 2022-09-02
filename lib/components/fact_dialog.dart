import 'package:flutter/material.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/utils/utils.dart';

class FactDialog extends StatelessWidget {
  const FactDialog({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Utils.appBorderRadius)),
      child: ConstrainedBox(
          constraints: const BoxConstraints(
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
                    style: const TextStyle(
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
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
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
  }
}
