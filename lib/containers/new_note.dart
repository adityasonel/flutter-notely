import 'package:flutter/material.dart';
import 'package:notely/components/app_header.dart';
import 'package:notely/utils/app_colors.dart';
import 'package:notely/utils/utils.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewNote();
}

class _NewNote extends State<NewNote> {
  String folderName = "";
  String note = "";

  late TextEditingController _folderEditingController;
  late TextEditingController _noteEditingController;

  @override
  void initState() {
    super.initState();
    _folderEditingController = TextEditingController();
    _noteEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: AppColors.blackColor,
            body: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    AppHeader(
                      title: "new note",
                      shouldShowBackButton: true,
                      shouldShowSettingButton: false,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: Colors.white24)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    contentPadding: const EdgeInsets.all(25),
                                    hintText: "Folder",
                                    hintStyle: const TextStyle(
                                        color: Colors.white24,
                                        fontFamily: Utils.appFontFamily),
                                    counterText: ""),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: Utils.appFontFamily,
                                    fontSize: 22),
                                maxLength: 54,
                                maxLines: 1,
                                onChanged: (value) {
                                  debugPrint("value: $value");
                                  setState(() {
                                    folderName = value;
                                  });
                                },
                                controller: _folderEditingController,
                              ),
                              const SizedBox(height: 16.0),
                              TextField(
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: Colors.white24)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(0),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    contentPadding: const EdgeInsets.all(25),
                                    hintText: "Note",
                                    hintStyle: const TextStyle(
                                        color: Colors.white24,
                                        fontFamily: Utils.appFontFamily)),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: Utils.appFontFamily),
                                cursorColor: Colors.white,
                                maxLines: 8,
                                onChanged: (value) {
                                  debugPrint("value: $value");
                                  setState(() {
                                    note = value;
                                  });
                                },
                                controller: _noteEditingController,
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            )));
  }
}
