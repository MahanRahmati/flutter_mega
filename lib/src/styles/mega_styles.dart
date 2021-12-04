import 'package:flutter/material.dart';

abstract class MegaStyle {
  // Colors

  // BackgroundColor
  static const Color backgroundColorLight = Color(0xFFFBFBFB);
  static const Color backgroundColorDark = Color(0xFF242424);

  // BackgroundColorDisabled
  static const Color backgroundColorDisabledLight = Color(0xFFF1F1F1);
  static const Color backgroundColorDisabledDark = Color(0xFF2E2E2E);

  // CardBackgroundColor
  static const Color cardBackgroundColorLight = Color(0xFFFFFFFF);
  static const Color cardBackgroundColorDark = Color(0xFFD4D4D4);
  
  // PrimaryTextColor
  static const Color primaryTextColorLight = Color(0xFF2E3436);
  static const Color primaryTextColorDark = Color(0xFFE5E5E5);

  // SecondaryTextColor
  static const Color secondaryTextColorLight = Color(0xFF888888);
  static const Color secondaryTextColorDark = Color(0xFF949494);

  // HeaderColor
  static const Color headerColorLight = Color(0xFFEBEBEB);
  static const Color headerColorDark = Color(0xFF303030);

  // HoverColor
  static const Color hoverColorLight = Color(0xFFD8D8D8);
  static const Color hoverColorDark = Color(0xFF454545);

  // BorderColor
  static const Color borderColorLight = Color(0xFFCFCFCF);
  static const Color borderColorDark = Color(0xFF737373);

  // IconColor
  static const Color iconColorLight = Color(0xFF2E3436);
  static const Color iconColorDark = Color(0xFFE5E5E5);

  // IconColorDisabled
  static const Color iconColorDisabledLight = Color(0xFF888888);
  static const Color iconColorDisabledDark = Color(0xFF949494);

  // TextFieldBackgroundColor
  static const Color textFieldBackgroundColorLight = Color(0xFFFFFFFF);
  static const Color textFieldBackgroundColorDark = Color(0xFF1E1E1E);

  // HintColor
  static const Color hintColorLight = Color(0xFF666666);
  static const Color hintColorDark = Color(0xFFA5A5A5);

  // AccentColors
  static const Color accentColor1 = Color(0xFF36AEF9);
  static const Color accentColor2 = Color(0xFF807DFC);
  static const Color accentColor3 = Color(0xFFFFA726);
  static const Color accentColor4 = Color(0xFF26A69A);

  // ErrorColor
  static const Color errorColor = Color(0xFFF44336);

  // Doubles
  static const double padding = 7;
  static const double halfPadding = 3.5;
  static const double borderRadiusSize = 5.0;
  static const double headerBarHeight = 48;
  static const double buttonSize = 34;
  static const double iconSize = 17;

  // Durations
  static const Duration basicDuration = Duration(milliseconds: 200);

  // Curves
  static const Curve basicCurve = Curves.ease;

  // Paddings
  static const EdgeInsets normal = EdgeInsets.all(padding);
  static const EdgeInsets small = EdgeInsets.all(halfPadding);
  static const EdgeInsets horizontal = EdgeInsets.symmetric(
    horizontal: padding,
  );
  static const EdgeInsets vertical = EdgeInsets.symmetric(
    vertical: padding,
  );
  static const EdgeInsets hHorizontal = EdgeInsets.symmetric(
    horizontal: halfPadding,
  );
  static const EdgeInsets hVertical = EdgeInsets.symmetric(
    vertical: halfPadding,
  );
  static const EdgeInsets left = EdgeInsets.only(left: padding);
  static const EdgeInsets top = EdgeInsets.only(top: padding);
  static const EdgeInsets right = EdgeInsets.only(right: padding);
  static const EdgeInsets bottom = EdgeInsets.only(bottom: padding);

  // BorderRadius
  static const BorderRadius borderRadius = BorderRadius.all(
    Radius.circular(borderRadiusSize),
  );
}
