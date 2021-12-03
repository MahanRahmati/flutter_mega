import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaLinkedTextButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VoidCallback? onPressed;

  const MegaLinkedTextButton({
    Key? key,
    required this.text,
    this.isActive = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaLinkedTextButtonState createState() => _MegaLinkedTextButtonState();
}

class _MegaLinkedTextButtonState extends State<MegaLinkedTextButton> {
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
          child: Text(widget.text, style: Theme.of(context).textTheme.button),
        ),
      ),
    );
  }
}
