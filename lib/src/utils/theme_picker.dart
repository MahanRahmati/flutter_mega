import 'package:flutter/material.dart';

// Based on https://github.com/jesusrp98/flutter_gtk/blob/master/lib/utils/theme_picker.dart

class ThemePicker {
  final BuildContext context;

  const ThemePicker._(this.context);

  factory ThemePicker.of(BuildContext context) => ThemePicker._(context);

  T pick<T>({required T light, required T dark}) =>
      Theme.of(context).brightness == Brightness.light ? light : dark;
}
