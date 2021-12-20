import 'package:flutter/widgets.dart';

abstract class MegaStyle {
  // Colors

  static const Color transparent = Color(0x00000000);

  // BackgroundColor
  static const Color backgroundColorLight = Color(0xFFF5F5F5); //245
  static const Color backgroundColorDark = Color(0xFF141414); //14

  // BackgroundColorDisabled
  static const Color backgroundColorDisabledLight = Color(0xFFE7E7E7); //231
  static const Color backgroundColorDisabledDark = Color(0xFF212121); //21

  // CardBackgroundColor
  static const Color cardBackgroundColorLight = Color(0xFFFCFCFC); //252
  static const Color cardBackgroundColorDark = Color(0xFF282828); //28

  // HeaderColor
  static const Color headerColorLight = Color(0xFFE0E0E0); //224
  static const Color headerColorDark = Color(0xFF070707); //07

  // SideColor
  static const Color sideColorLight = backgroundColorLight;
  static const Color sideColorDark = backgroundColorDark;

  // HoverColor
  static const Color hoverColorLight = Color(0xFFECECEC); //238
  static const Color hoverColorDark = Color(0xFF353535); //35

  // BorderColor
  static const Color borderColorLight = Color(0xFFD2D2D2); //210
  static const Color borderColorDark = Color(0xFF494949); //49

  // PrimaryTextColor
  static const Color primaryTextColorLight = backgroundColorDark;
  static const Color primaryTextColorDark = backgroundColorLight;

  // SecondaryTextColor
  static const Color secondaryTextColorLight = hoverColorDark;
  static const Color secondaryTextColorDark = hoverColorLight;

  // IconColor
  static const Color iconColorLight = hoverColorDark;
  static const Color iconColorDark = hoverColorLight;

  // IconColorDisabled
  static const Color disabledColorLight = Color(0xFF424242); //42
  static const Color disabledColorDark = Color(0xFFD9D9D9); //217

  // TextFieldBackgroundColor
  static const Color textFieldBackgroundColorLight = backgroundColorLight;
  static const Color textFieldBackgroundColorDark = backgroundColorDark;

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
  static const double borderRadiusSize = 7;
  static const double headerBarHeight = 49;
  static const double bottomBarHeight = 49;
  static const double sideBarWidth = 315;
  static const double sideBarItemWidth = 301;
  static const double sideBarCompactWidth = 49;
  static const double tabBarHeight = 42;
  static const double maxTabWidth = 210;
  static const double minTabWidth = 105;
  static const double buttonSize = 35;
  static const double radioButtonSize = 21;
  static const double radioIndicatorSize = 12.25;
  static const double badgeSize = 28;
  static const double iconSize = 21;

  // Durations
  static const Duration basicDuration = Duration(milliseconds: 210);

  // Curves
  static const Curve basicCurve = Curves.ease;

  // Paddings
  static const EdgeInsets normal = EdgeInsets.all(padding);
  static const EdgeInsets small = EdgeInsets.all(halfPadding);
  static const EdgeInsets horizontal = EdgeInsets.symmetric(
    horizontal: padding,
  );
  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: padding);
  static const EdgeInsets smallHorizontal = EdgeInsets.symmetric(
    horizontal: halfPadding,
  );
  static const EdgeInsets smallVertical = EdgeInsets.symmetric(
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

  static const BorderRadius radioBorderRadius = BorderRadius.all(
    Radius.circular(radioButtonSize),
  );
}
