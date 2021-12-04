import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaBottomNavigationBarCompactItem extends StatefulWidget {
  final IconData icon;
  final Color accentColor;
  final bool isActive;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VoidCallback? onPressed;

  const MegaBottomNavigationBarCompactItem({
    Key? key,
    required this.icon,
    required this.accentColor,
    this.isActive = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaBottomNavigationBarCompactItemState createState() =>
      _MegaBottomNavigationBarCompactItemState();
}

class _MegaBottomNavigationBarCompactItemState
    extends State<MegaBottomNavigationBarCompactItem> {
  bool hovering = false;
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed != null) disabled = false;
    return Padding(
      padding: MegaStyle.small,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
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
          AnimatedContainer(
            height: MegaStyle.halfPadding,
            width: widget.isActive ? MegaStyle.iconSize : 0,
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
