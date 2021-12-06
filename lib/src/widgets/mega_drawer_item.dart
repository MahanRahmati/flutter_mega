import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaDrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Widget trailing;
  final Color accentColor;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaDrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing = const SizedBox(),
    required this.accentColor,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaDrawerItemState createState() => _MegaDrawerItemState();
}

class _MegaDrawerItemState extends State<MegaDrawerItem> {
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
                  const Spacer(),
                  widget.trailing,
                ],
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
