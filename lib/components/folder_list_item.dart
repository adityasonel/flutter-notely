import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:notely/models/folder.dart';
import 'package:notely/utils/utils.dart';

class FolderListItem extends StatelessWidget {
  const FolderListItem(
      {super.key,
      required this.folder,
      required this.onPress,
      this.duration = const Duration(milliseconds: 380)});

  final Folder folder;
  final Duration duration;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
        position: folder.id,
        duration: duration,
        child: SlideAnimation(
            duration: duration,
            child: FadeInAnimation(
                child: GestureDetector(
              onTap: () {
                onPress();
              },
              child: Container(
                height: 158,
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(Utils.appBorderRadius)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            folder.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                                fontSize: 15),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            size: 32,
                            color: Colors.white70,
                          )
                        ],
                      ),
                      Text("${folder.itemCount}",
                          style: const TextStyle(
                              fontSize: 70,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ))));
  }
}
