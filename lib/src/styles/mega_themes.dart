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
          hintStyle: const TextStyle(color: MegaStyle.secondaryTextColorLight),
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
          hintStyle: const TextStyle(color: MegaStyle.secondaryTextColorDark),
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
  );
}