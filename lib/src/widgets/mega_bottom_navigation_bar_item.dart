import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaBottomNavigationBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color accentColor;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final ValueChanged<int> onTap;
  final int index;

  const MegaBottomNavigationBarItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.accentColor,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  _MegaBottomNavigationBarItemState createState() =>
      _MegaBottomNavigationBarItemState();
}

class _MegaBottomNavigationBarItemState
    extends State<MegaBottomNavigationBarItem> {
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
              child: Row(
                children: [
                  Padding(
                    padding: MegaStyle.right,
                    child: Icon(
                      widget.icon,
                      size: MegaStyle.iconSize,
                      color: ThemePicker.of(context).pick(
                        light: MegaStyle.iconColorLight,
                        dark: MegaStyle.iconColorDark,
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: ThemePicker.of(context).pick(
                            light: MegaStyle.primaryTextColorLight,
                            dark: MegaStyle.primaryTextColorDark,
                          ),
                        ),
                  ),
                ],
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
