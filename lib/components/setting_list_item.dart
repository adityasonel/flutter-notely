import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/utils/utils.dart';

class SettingListItem extends StatefulWidget {
  const SettingListItem(
      {super.key,
      required this.index,
      required this.title,
      required this.icon,
      required this.onPress,
      this.loadingIndex = -1,
      this.duration = const Duration(milliseconds: 380)});

  final int index;
  final Duration duration;
  final String title;
  final IconData? icon;
  final Function onPress;
  final int loadingIndex;

  @override
  State<StatefulWidget> createState() => _SettingListItem();
}

class _SettingListItem extends State<SettingListItem> {
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: widget.index,
        duration: widget.duration,
        child: SlideAnimation(
            duration: widget.duration,
            child: FadeInAnimation(
                child: widget.loadingIndex == widget.index
                    ? Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        width: double.infinity,
                        height: 128,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Utils.appBorderRadius),
                          color: Colors.white10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: Colors.white24,
                            ),
                          ],
                        ))
                    : GestureDetector(
                        onTap: () {
                          widget.onPress(context, widget.title);
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
                              padding:
                                  const EdgeInsets.only(left: 24, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.title
                                        .replaceAll("_", " ")
                                        .toLowerCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    widget.icon,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ))))));
  }
}
