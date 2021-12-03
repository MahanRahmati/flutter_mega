import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaLinkedButtons extends StatelessWidget {
  final List<Widget> buttons;

  const MegaLinkedButtons({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.hHorizontal,
      child: Container(
        height: MegaStyle.buttonSize,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          border: Border.all(
            color: ThemePicker.of(context).pick(
              light: MegaStyle.borderColorLight,
              dark: MegaStyle.borderColorDark,
            ),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Row(children: buttons),
        ),
      ),
    );
  }
}
