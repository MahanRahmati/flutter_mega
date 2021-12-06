import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaTextButton extends StatefulWidget {
  final String text;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaTextButton({
    Key? key,
    required this.text,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaTextButtonState createState() => _MegaTextButtonState();
}

class _MegaTextButtonState extends State<MegaTextButton> {
  bool hovering = false;
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed != null) disabled = false;
    return Padding(
      padding: MegaStyle.hHorizontal,
      child: InkWell(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onTap: widget.onPressed,
        onHover: (hover) => setState(() => hovering = hover),
        borderRadius: MegaStyle.borderRadius,
        child: AnimatedContainer(
          height: MegaStyle.buttonSize,
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(
            borderRadius: MegaStyle.borderRadius,
            border: Border.all(
              color: ThemePicker.of(context).pick(
                light: MegaStyle.borderColorLight,
                dark: MegaStyle.borderColorDark,
              ),
            ),
            color: disabled
                ? ThemePicker.of(context).pick(
                    light: MegaStyle.backgroundColorDisabledLight,
                    dark: MegaStyle.backgroundColorDisabledDark,
                  )
                : widget.selected
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
          child: Align(
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
        ),
      ),
    );
  }
}
