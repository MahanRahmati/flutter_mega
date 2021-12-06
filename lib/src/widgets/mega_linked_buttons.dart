import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';
import 'package:mega/src/widgets/mega_divider.dart';

class MegaLinkedButtons extends StatelessWidget {
  final List<Widget> buttons;

  const MegaLinkedButtons({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> addDividers(List<Widget> buttons) {
      for (var i = 1; i < buttons.length; i = i + 2) {
        buttons.insert(i, const MegaVerticalDivider());
      }
      return buttons;
    }

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
          child: Row(children: addDividers(buttons)),
        ),
      ),
    );
  }
}
