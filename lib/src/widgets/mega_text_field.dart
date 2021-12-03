import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaTextField extends StatelessWidget {
  final bool? enabled;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final Color accentColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function(String)? onChanged;
  final VoidCallback? onSuffixIconPressed;

  const MegaTextField({
    Key? key,
    this.enabled,
    this.initialValue,
    this.controller,
    this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    required this.accentColor,
    this.focusNode,
    this.autofocus = false,
    this.keyboardType,
    this.maxLines,
    this.onChanged,
    this.onSuffixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: SizedBox(
        height: MegaStyle.buttonSize,
        child: TextFormField(
          enabled: enabled ?? true,
          initialValue: initialValue,
          controller: controller,
          obscureText: obscureText ?? false,
          focusNode: focusNode,
          autofocus: autofocus ?? false,
          keyboardType: keyboardType,
          cursorColor: accentColor,
          maxLines: maxLines ?? 1,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              prefixIcon,
              size: MegaStyle.iconSize,
              color: ThemePicker.of(context).pick(
                light: MegaStyle.hintColorLight,
                dark: MegaStyle.hintColorDark,
              ),
            ),
            suffixIcon: (suffixIcon != null)
                ? IconButton(
                    iconSize: MegaStyle.iconSize,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      suffixIcon,
                      color: ThemePicker.of(context).pick(
                        light: MegaStyle.hintColorLight,
                        dark: MegaStyle.hintColorDark,
                      ),
                    ),
                    onPressed: onSuffixIconPressed,
                  )
                : null,
            counterText: "",
          ),
        ),
      ),
    );
  }
}
