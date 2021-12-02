import 'package:flutter/material.dart';
import 'package:mega/src/colors/mega_colors.dart';
import 'package:mega/src/utils/theme_picker.dart';

class MegaDrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final Color accentColor;
  final bool isActive;
  final FocusNode? focusNode;
  final bool? autofocus;
  final VoidCallback? onPressed;

  const MegaDrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing,
    required this.accentColor,
    this.isActive = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MegaDrawerItemState createState() => _MegaDrawerItemState();
}

class _MegaDrawerItemState extends State<MegaDrawerItem> {
  bool hovering = false;
  bool disabled = true;

  @override
  Widget build(BuildContext context) {
    if (widget.onPressed != null) disabled = false;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          InkWell(
            onTap: widget.onPressed,
            onHover: (hover) => setState(() => hovering = hover),
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            focusNode: widget.focusNode,
            autofocus: widget.autofocus ?? false,
            child: AnimatedContainer(
              height: 34,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                color: disabled
                    ? ThemePicker.of(context).pick(
                        light: MegaColors.backgroundColorLight,
                        dark: MegaColors.backgroundColorDark,
                      )
                    : widget.isActive
                        ? ThemePicker.of(context).pick(
                            light: MegaColors.hoverColorLight,
                            dark: MegaColors.hoverColorDark,
                          )
                        : hovering
                            ? ThemePicker.of(context).pick(
                                light: MegaColors.hoverColorLight,
                                dark: MegaColors.hoverColorDark,
                              )
                            : ThemePicker.of(context).pick(
                                light: MegaColors.backgroundColorLight,
                                dark: MegaColors.backgroundColorDark,
                              ),
              ),
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 34,
                    child: Icon(
                      widget.icon,
                      size: 17,
                      color: disabled
                          ? ThemePicker.of(context).pick(
                              light: MegaColors.iconColorDisabledLight,
                              dark: MegaColors.iconColorDisabledDark,
                            )
                          : ThemePicker.of(context).pick(
                              light: MegaColors.iconColorLight,
                              dark: MegaColors.iconColorDark,
                            ),
                    ),
                  ),
                  Text(widget.title),
                  const Spacer(),
                  if (widget.trailing != null) widget.trailing!,
                ],
              ),
            ),
          ),
          AnimatedContainer(
            height: 17,
            width: 3,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              color: widget.isActive
                      ? widget.accentColor
                      : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
