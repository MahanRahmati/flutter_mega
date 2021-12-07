import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';

class MegaThemes {
  static final megaLight = ThemeData(
    colorScheme: ThemeData.light().colorScheme.copyWith(
          secondary: MegaStyle.accentColor1,
        ),
    scaffoldBackgroundColor: MegaStyle.backgroundColorLight,
    inputDecorationTheme: ThemeData.light().inputDecorationTheme.copyWith(
          contentPadding: const EdgeInsets.only(bottom: MegaStyle.iconSize),
          filled: true,
          fillColor: MegaStyle.textFieldBackgroundColorLight,
          hoverColor: MegaStyle.hoverColorLight,
          isDense: true,
          hintStyle: const TextStyle(color: MegaStyle.hintColorLight),
          counterStyle: const TextStyle(height: double.minPositive),
          disabledBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.backgroundColorLight),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.accentColor1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.borderColorLight),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.errorColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.errorColor),
          ),
          errorStyle: const TextStyle(height: 0, color: Colors.transparent),
        ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 96,
        letterSpacing: -1.5,
        color: MegaStyle.primaryTextColorLight,
      ),
      headline2: TextStyle(
        fontSize: 60,
        letterSpacing: -0.5,
        color: MegaStyle.primaryTextColorLight,
      ),
      headline3: TextStyle(
        fontSize: 48,
        letterSpacing: 0.0,
        color: MegaStyle.primaryTextColorLight,
      ),
      headline4: TextStyle(
        fontSize: 34,
        letterSpacing: -0.25,
        color: MegaStyle.primaryTextColorLight,
      ),
      headline5: TextStyle(
        fontSize: 24,
        letterSpacing: 0.0,
        color: MegaStyle.primaryTextColorLight,
      ),
      headline6: TextStyle(
        fontSize: 20,
        letterSpacing: 0.15,
        color: MegaStyle.primaryTextColorLight,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        letterSpacing: 0.15,
        color: MegaStyle.secondaryTextColorLight,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        letterSpacing: 0.1,
        color: MegaStyle.secondaryTextColorLight,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        letterSpacing: 0.5,
        color: MegaStyle.primaryTextColorLight,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        letterSpacing: 0.25,
        color: MegaStyle.primaryTextColorLight,
      ),
      button: TextStyle(
        fontSize: 14,
        letterSpacing: 1.25,
        color: MegaStyle.primaryTextColorLight,
      ),
      caption: TextStyle(
        fontSize: 12,
        letterSpacing: 0.4,
        color: MegaStyle.primaryTextColorLight,
      ),
      overline: TextStyle(
        fontSize: 10,
        letterSpacing: 1.5,
        color: MegaStyle.primaryTextColorLight,
      ),
    ),
  );

  static final megaDark = ThemeData(
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: MegaStyle.accentColor1,
        ),
    scaffoldBackgroundColor: MegaStyle.backgroundColorDark,
    inputDecorationTheme: ThemeData.dark().inputDecorationTheme.copyWith(
          contentPadding: const EdgeInsets.only(bottom: MegaStyle.iconSize),
          filled: true,
          fillColor: MegaStyle.textFieldBackgroundColorDark,
          hoverColor: MegaStyle.hoverColorDark,
          isDense: true,
          hintStyle: const TextStyle(color: MegaStyle.hintColorDark),
          counterStyle: const TextStyle(height: double.minPositive),
          disabledBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.backgroundColorDark),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.accentColor1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.borderColorDark),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.errorColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: MegaStyle.borderRadius,
            borderSide: BorderSide(color: MegaStyle.errorColor),
          ),
          errorStyle: const TextStyle(height: 0, color: Colors.transparent),
        ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 96,
        letterSpacing: -1.5,
        color: MegaStyle.primaryTextColorDark,
      ),
      headline2: TextStyle(
        fontSize: 60,
        letterSpacing: -0.5,
        color: MegaStyle.primaryTextColorDark,
      ),
      headline3: TextStyle(
        fontSize: 48,
        letterSpacing: 0.0,
        color: MegaStyle.primaryTextColorDark,
      ),
      headline4: TextStyle(
        fontSize: 34,
        letterSpacing: -0.25,
        color: MegaStyle.primaryTextColorDark,
      ),
      headline5: TextStyle(
        fontSize: 24,
        letterSpacing: 0.0,
        color: MegaStyle.primaryTextColorDark,
      ),
      headline6: TextStyle(
        fontSize: 20,
        letterSpacing: 0.15,
        color: MegaStyle.primaryTextColorDark,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        letterSpacing: 0.15,
        color: MegaStyle.secondaryTextColorDark,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        letterSpacing: 0.1,
        color: MegaStyle.secondaryTextColorDark,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        letterSpacing: 0.5,
        color: MegaStyle.primaryTextColorDark,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        letterSpacing: 0.25,
        color: MegaStyle.primaryTextColorDark,
      ),
      button: TextStyle(
        fontSize: 14,
        letterSpacing: 1.25,
        color: MegaStyle.primaryTextColorDark,
      ),
      caption: TextStyle(
        fontSize: 12,
        letterSpacing: 0.4,
        color: MegaStyle.primaryTextColorDark,
      ),
      overline: TextStyle(
        fontSize: 10,
        letterSpacing: 1.5,
        color: MegaStyle.primaryTextColorDark,
      ),
    ),
  );
}
