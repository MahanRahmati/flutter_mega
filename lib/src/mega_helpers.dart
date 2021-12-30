import 'package:flutter/services.dart';
import 'package:mega/mega.dart';

bool isDark(context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

Color backgroundColor(context) => isDark(context)
    ? MegaStyle.backgroundColorDark
    : MegaStyle.backgroundColorLight;

Color reverseBackgroundColor(context) => isDark(context)
    ? MegaStyle.backgroundColorLight
    : MegaStyle.backgroundColorDark;

Color backgroundColorDisabled(context) => isDark(context)
    ? MegaStyle.backgroundColorDisabledDark
    : MegaStyle.backgroundColorDisabledLight;

Color reverseBackgroundColorDisabled(context) => isDark(context)
    ? MegaStyle.backgroundColorDisabledLight
    : MegaStyle.backgroundColorDisabledDark;

Color headerColor(context) =>
    isDark(context) ? MegaStyle.headerColorDark : MegaStyle.headerColorLight;

Color sideColor(context) =>
    isDark(context) ? MegaStyle.sideColorDark : MegaStyle.sideColorLight;

Color cardBackgroundColor(context) => isDark(context)
    ? MegaStyle.cardBackgroundColorDark
    : MegaStyle.cardBackgroundColorLight;

Color hoverColor(context) =>
    isDark(context) ? MegaStyle.hoverColorDark : MegaStyle.hoverColorLight;

Color borderColor(context) =>
    isDark(context) ? MegaStyle.borderColorDark : MegaStyle.borderColorLight;

Color reverseBorderColor(context) =>
    isDark(context) ? MegaStyle.borderColorLight : MegaStyle.borderColorDark;

Color primaryTextColor(context) => isDark(context)
    ? MegaStyle.primaryTextColorDark
    : MegaStyle.primaryTextColorLight;

Color reversePrimaryTextColor(context) => isDark(context)
    ? MegaStyle.primaryTextColorLight
    : MegaStyle.primaryTextColorDark;

Color secondaryTextColor(context) => isDark(context)
    ? MegaStyle.secondaryTextColorDark
    : MegaStyle.secondaryTextColorLight;

Color iconColor(context) =>
    isDark(context) ? MegaStyle.iconColorDark : MegaStyle.iconColorLight;

Color disabledColor(context) => isDark(context)
    ? MegaStyle.disabledColorDark
    : MegaStyle.disabledColorLight;

TextStyle headline1(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
      fontSize: 96,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle headline2(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
      fontSize: 60,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle headline3(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 48,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle headline4(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 34,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle headline5(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 24,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle headline6(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 20,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle subtitle1(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 16,
      decoration: TextDecoration.none,
      color: secondaryTextColor(context),
    );

TextStyle subtitle2(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      decoration: TextDecoration.none,
      color: secondaryTextColor(context),
    );

TextStyle bodyText1(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 16,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle bodyText2(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 14,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle button(context, bool disabled) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      decoration: TextDecoration.none,
      color: disabled ? disabledColor(context) : primaryTextColor(context),
    );

TextStyle caption(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 12,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

TextStyle statusBarText(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 12,
      decoration: TextDecoration.none,
      color: reversePrimaryTextColor(context),
    );

TextStyle overline(context) => TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 10,
      decoration: TextDecoration.none,
      color: primaryTextColor(context),
    );

double deviceWidth(context) => MediaQuery.of(context).size.width;

BorderRadius megaBorderRadius(double borderRadius) =>
    BorderRadius.all(Radius.circular(borderRadius));
