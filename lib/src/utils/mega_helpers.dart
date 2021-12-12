import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

// Colors
Color backgroundColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.backgroundColorLight
      : MegaStyle.backgroundColorDark;
}

Color backgroundColorDisabled(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.backgroundColorDisabledLight
      : MegaStyle.backgroundColorDisabledDark;
}

Color headerColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.headerColorLight
      : MegaStyle.headerColorDark;
}

Color sideColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.sideColorLight
      : MegaStyle.sideColorDark;
}

Color cardBackgroundColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.cardBackgroundColorLight
      : MegaStyle.cardBackgroundColorDark;
}

Color hoverColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.hoverColorLight
      : MegaStyle.hoverColorDark;
}

Color borderColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.borderColorLight
      : MegaStyle.borderColorDark;
}

Color primaryTextColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.primaryTextColorLight
      : MegaStyle.primaryTextColorDark;
}

Color secondaryTextColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.secondaryTextColorLight
      : MegaStyle.secondaryTextColorDark;
}

Color iconColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.iconColorLight
      : MegaStyle.iconColorDark;
}

Color disabledColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light
      ? MegaStyle.disabledColorLight
      : MegaStyle.disabledColorDark;
}

// TextStyles
TextStyle headline1(context) {
  return TextStyle(
    fontSize: 96,
    letterSpacing: -1.5,
    color: primaryTextColor(context),
  );
}

TextStyle headline2(context) {
  return TextStyle(
    fontSize: 60,
    letterSpacing: -0.5,
    color: primaryTextColor(context),
  );
}

TextStyle headline3(context) {
  return TextStyle(
    fontSize: 48,
    letterSpacing: 0.0,
    color: primaryTextColor(context),
  );
}

TextStyle headline4(context) {
  return TextStyle(
    fontSize: 34,
    letterSpacing: -0.25,
    color: primaryTextColor(context),
  );
}

TextStyle headline5(context) {
  return TextStyle(
    fontSize: 24,
    letterSpacing: 0.0,
    color: primaryTextColor(context),
  );
}

TextStyle headline6(context) {
  return TextStyle(
    fontSize: 20,
    letterSpacing: 0.15,
    color: primaryTextColor(context),
  );
}

TextStyle subtitle1(context) {
  return TextStyle(
    fontSize: 16,
    letterSpacing: 0.15,
    color: secondaryTextColor(context),
  );
}

TextStyle subtitle2(context) {
  return TextStyle(
    fontSize: 14,
    letterSpacing: 0.1,
    color: secondaryTextColor(context),
  );
}

TextStyle bodyText1(context) {
  return TextStyle(
    fontSize: 16,
    letterSpacing: 0.5,
    color: primaryTextColor(context),
  );
}

TextStyle bodyText2(context) {
  return TextStyle(
    fontSize: 14,
    letterSpacing: 0.25,
    color: primaryTextColor(context),
  );
}

TextStyle button(context, bool disabled) {
  return TextStyle(
    fontSize: 14,
    letterSpacing: 1.25,
    color: disabled ? disabledColor(context) : primaryTextColor(context),
  );
}

TextStyle caption(context) {
  return TextStyle(
    fontSize: 12,
    letterSpacing: 0.4,
    color: primaryTextColor(context),
  );
}

TextStyle overline(context) {
  return TextStyle(
    fontSize: 10,
    letterSpacing: 1.5,
    color: primaryTextColor(context),
  );
}
