import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaHeaderBar extends StatelessWidget {
  final Widget leading;
  final Widget center;
  final Widget trailing;

  const MegaHeaderBar({
    Key? key,
    this.leading = const SizedBox(),
    this.center = const SizedBox(),
    this.trailing = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ThemePicker.of(context).pick(
                light: MegaStyle.borderColorLight,
                dark: MegaStyle.borderColorDark,
              ),
            ),
            bottom: BorderSide(
              color: ThemePicker.of(context).pick(
                light: MegaStyle.borderColorLight,
                dark: MegaStyle.borderColorDark,
              ),
            ),
          ),
          color: ThemePicker.of(context).pick(
            light: MegaStyle.headerColorLight,
            dark: MegaStyle.headerColorDark,
          ),
        ),
        height: MegaStyle.headerBarHeight,
        width: double.infinity,
        child: Padding(
          padding: MegaStyle.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading,
              center,
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
