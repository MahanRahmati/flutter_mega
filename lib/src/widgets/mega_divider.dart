import 'package:flutter/widgets.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaHorizontalDivider extends StatelessWidget {
  final double? height;
  final double? indent;
  final double? endIndent;

  const MegaHorizontalDivider({
    Key? key,
    this.height,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Container(
          margin: EdgeInsetsDirectional.only(
            start: indent ?? 0.0,
            end: endIndent ?? 0.0,
          ),
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
  final double? width;
  final double? indent;
  final double? endIndent;

  const MegaVerticalDivider({
    Key? key,
    this.width,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Center(
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: indent ?? 0.0,
            bottom: endIndent ?? 0.0,
          ),
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
