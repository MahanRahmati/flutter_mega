import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaBottomNavigationBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Color accentColor;
  final bool isActive;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VoidCallback? onPressed;

  const MegaBottomNavigationBarItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.accentColor,
    this.isActive = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaBottomNavigationBarItemState createState() =>
      _MegaBottomNavigationBarItemState();
}

class _MegaBottomNavigationBarItemState
    extends State<MegaBottomNavigationBarItem> {
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
                  Text(
                    widget.title,
                    style: disabled
                        ? Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: ThemePicker.of(context).pick(
                                light: MegaStyle.iconColorDisabledLight,
                                dark: MegaStyle.iconColorDisabledDark,
                              ),
                            )
                        : Theme.of(context).textTheme.subtitle1!.copyWith(
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
