import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaScaffold extends StatelessWidget {
  final Widget headerBar;
  final Widget body;
  final Widget bottomBar;

  const MegaScaffold({
    Key? key,
    this.headerBar = const SizedBox(),
    this.body = const SizedBox.expand(),
    this.bottomBar = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: ThemePicker.of(context).pick(
                light: MegaStyle.backgroundColorLight,
                dark: MegaStyle.backgroundColorDark,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [headerBar, Expanded(child: body)],
              ),
            ),
          ),
          bottomBar,
        ],
      ),
    );
  }
}
