import 'package:flutter/widgets.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaStatusBar extends StatelessWidget {
  final Widget child;

  const MegaStatusBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Container(
        height: MegaStyle.buttonSize,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          border: Border.all(
            color: ThemePicker.of(context).pick(
              light: MegaStyle.borderColorLight,
              dark: MegaStyle.borderColorDark,
            ),
          ),
          color: ThemePicker.of(context).pick(
            light: MegaStyle.backgroundColorDark,
            dark: MegaStyle.backgroundColorLight,
          ),
        ),
        child: child,
      ),
    );
  }
}
