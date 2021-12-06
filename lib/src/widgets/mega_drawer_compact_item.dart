import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaDrawerCompactItem extends StatefulWidget {
  final IconData icon;
  final Color accentColor;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaDrawerCompactItem({
    Key? key,
    required this.icon,
    required this.accentColor,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaDrawerCompactItemState createState() => _MegaDrawerCompactItemState();
}

class _MegaDrawerCompactItemState extends State<MegaDrawerCompactItem> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          InkWell(
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
            onTap: widget.onPressed,
            onHover: (hover) => setState(() => hovering = hover),
            borderRadius: MegaStyle.borderRadius,
            child: AnimatedContainer(
              height: MegaStyle.buttonSize,
              width: MegaStyle.buttonSize,
              duration: MegaStyle.basicDuration,
              curve: MegaStyle.basicCurve,
              decoration: BoxDecoration(
                borderRadius: MegaStyle.borderRadius,
                color: widget.selected
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
                color: ThemePicker.of(context).pick(
                  light: MegaStyle.iconColorLight,
                  dark: MegaStyle.iconColorDark,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            height: widget.selected ? MegaStyle.iconSize : 0,
            width: MegaStyle.halfPadding,
            duration: MegaStyle.basicDuration,
            curve: MegaStyle.basicCurve,
            decoration: BoxDecoration(
              borderRadius: MegaStyle.borderRadius,
              color: widget.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
