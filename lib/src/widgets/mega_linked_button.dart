import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaLinkedButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VoidCallback? onPressed;

  const MegaLinkedButton({
    Key? key,
    required this.text,
    required this.icon,
    this.isActive = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaLinkedButtonState createState() => _MegaLinkedButtonState();
}

class _MegaLinkedButtonState extends State<MegaLinkedButton> {
  bool hovering = false;
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed != null) disabled = false;
    return InkWell(
      onTap: widget.onPressed,
      onHover: (hover) => setState(() => hovering = hover),
      borderRadius: MegaStyle.borderRadius,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus ?? false,
      child: AnimatedContainer(
        height: MegaStyle.buttonSize,
        duration: MegaStyle.basicDuration,
        curve: MegaStyle.basicCurve,
        decoration: BoxDecoration(
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
        child: Row(
          children: [
            Padding(
              padding: MegaStyle.right,
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
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.text,
                style: disabled
                    ? Theme.of(context).textTheme.button!.copyWith(
                          color: ThemePicker.of(context).pick(
                            light: MegaStyle.iconColorDisabledLight,
                            dark: MegaStyle.iconColorDisabledDark,
                          ),
                        )
                    : Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}