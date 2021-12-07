import 'package:flutter/widgets.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaCard extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const MegaCard({
    Key? key,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          border: Border.all(
            color: ThemePicker.of(context).pick(
              light: MegaStyle.borderColorLight,
              dark: MegaStyle.borderColorDark,
            ),
          ),
          color: ThemePicker.of(context).pick(
            light: MegaStyle.cardBackgroundColorLight,
            dark: MegaStyle.cardBackgroundColorDark,
          ),
        ),
        child: child,
      ),
    );
  }
}
