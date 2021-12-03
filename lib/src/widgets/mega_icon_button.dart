import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
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
    return Padding(
      padding: MegaStyle.hHorizontal,
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (hover) => setState(() => hovering = hover),
        borderRadius: MegaStyle.borderRadius,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus ?? false,
        child: AnimatedContainer(
          height: MegaStyle.buttonSize,
          width: MegaStyle.buttonSize,
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(
            borderRadius: MegaStyle.borderRadius,
            border: Border.all(
              color: disabled
                  ? ThemePicker.of(context).pick(
                      light: MegaStyle.backgroundColorLight,
                      dark: MegaStyle.backgroundColorDark,
                    )
                  : ThemePicker.of(context).pick(
                      light: MegaStyle.borderColorLight,
                      dark: MegaStyle.borderColorDark,
                    ),
            ),
            color: disabled
                ? ThemePicker.of(context).pick(
                    light: MegaStyle.backgroundColorLight,
                    dark: MegaStyle.backgroundColorDark,
                  )
                : widget.isActive
                    ? ThemePicker.of(context).pick(
                        light: MegaStyle.hoverColorLight,
                        dark: MegaStyle.hoverColorDark,
                      )
                    : hovering
                        ? ThemePicker.of(context).pick(
                            light: MegaStyle.hoverColorLight,
                            dark: MegaStyle.hoverColorDark,
                          )
                        : ThemePicker.of(context).pick(
                            light: MegaStyle.backgroundColorLight,
                            dark: MegaStyle.backgroundColorDark,
                          ),
          ),
          padding: MegaStyle.horizontal,
          child: Icon(
            widget.icon,
            size: MegaStyle.iconSize,
            color: disabled
                ? ThemePicker.of(context).pick(
                    light: MegaStyle.iconColorDisabledLight,
                    dark: MegaStyle.iconColorDisabledDark,
                  )
                : ThemePicker.of(context).pick(
                    light: MegaStyle.iconColorLight,
                    dark: MegaStyle.iconColorDark,
                  ),
          ),
        ),
      ),
    );
  }
}
