import 'package:flutter/material.dart';
import 'package:mega/src/colors/mega_colors.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaIconButton extends StatefulWidget {
  final IconData icon;
  final bool isActive;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VoidCallback? onPressed;

  const MegaIconButton({
    Key? key,
    required this.icon,
    this.isActive = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaIconButtonState createState() => _MegaIconButtonState();
}

class _MegaIconButtonState extends State<MegaIconButton> {
  bool hovering = false;
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed != null) disabled = false;
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hover) => setState(() => hovering = hover),
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      focusNode: widget.focusNode,
      autofocus: widget.autofocus ?? false,
      child: AnimatedContainer(
        height: 34,
        width: 34,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(
            width: 1,
            color: disabled
                ? ThemePicker.of(context).pick(
                    light: MegaColors.backgroundColorLight,
                    dark: MegaColors.backgroundColorDark,
                  )
                : ThemePicker.of(context).pick(
                    light: MegaColors.borderColorLight,
                    dark: MegaColors.borderColorDark,
                  ),
          ),
          color: disabled
              ? ThemePicker.of(context).pick(
                  light: MegaColors.backgroundColorLight,
                  dark: MegaColors.backgroundColorDark,
                )
              : widget.isActive
                  ? ThemePicker.of(context).pick(
                      light: MegaColors.hoverColorLight,
                      dark: MegaColors.hoverColorDark,
                    )
                  : hovering
                      ? ThemePicker.of(context).pick(
                          light: MegaColors.hoverColorLight,
                          dark: MegaColors.hoverColorDark,
                        )
                      : ThemePicker.of(context).pick(
                          light: MegaColors.backgroundColorLight,
                          dark: MegaColors.backgroundColorDark,
                        ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Icon(
          widget.icon,
          size: 17,
          color: disabled
              ? ThemePicker.of(context).pick(
                  light: MegaColors.iconColorDisabledLight,
                  dark: MegaColors.iconColorDisabledDark,
                )
              : ThemePicker.of(context).pick(
                  light: MegaColors.iconColorLight,
                  dark: MegaColors.iconColorDark,
                ),
        ),
      ),
    );
  }
}
