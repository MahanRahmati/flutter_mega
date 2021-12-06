import 'package:flutter/widgets.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaHorizontalDivider extends StatelessWidget {
  const MegaHorizontalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: ThemePicker.of(context).pick(
              light: MegaStyle.borderColorLight,
              dark: MegaStyle.borderColorDark,
            ),
          ),
        ),
      ),
    );
  }
}

class MegaVerticalDivider extends StatelessWidget {
  const MegaVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.0,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: ThemePicker.of(context).pick(
              light: MegaStyle.borderColorLight,
              dark: MegaStyle.borderColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
