import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/utils/utils.dart';

class SettingListItem extends StatelessWidget {
  const SettingListItem(
      {super.key,
      required this.index,
      required this.title,
      required this.icon,
      required this.onPress,
      this.duration = const Duration(milliseconds: 380)});

  final int index;
  final Duration duration;
  final String title;
  final IconData? icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: index,
        duration: duration,
        child: SlideAnimation(
            duration: duration,
            child: FadeInAnimation(
                child: GestureDetector(
                    onTap: () {
                      onPress(context, title);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        width: double.infinity,
                        height: 128,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Utils.appBorderRadius),
                          color: Colors.white10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                title.replaceAll("_", " ").toLowerCase(),
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                icon,
                                color: AppColors.whiteColor,
                              )
                            ],
                          ),
                        ))))));
  }
}
