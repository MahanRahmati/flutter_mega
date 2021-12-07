import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaBottomNavigationBarCompactItem extends StatefulWidget {
  final IconData icon;
  final Color accentColor;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final ValueChanged<int> onTap;
  final int index;

  const MegaBottomNavigationBarCompactItem({
    Key? key,
    required this.icon,
    this.accentColor = MegaStyle.accentColor1,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  _MegaBottomNavigationBarCompactItemState createState() =>
      _MegaBottomNavigationBarCompactItemState();
}

class _MegaBottomNavigationBarCompactItemState
    extends State<MegaBottomNavigationBarCompactItem> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: () => widget.onTap(widget.index),
            focusNode: widget.focusNode,
            autofocus: widget.autofocus,
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
            height: MegaStyle.halfPadding,
            width: widget.selected ? MegaStyle.iconSize : 0,
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
