import 'package:flutter/material.dart' show Icons;
import 'package:mega/mega.dart';

class MegaCheckBox extends StatefulWidget {
  final bool? value;
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final Color accentColor;
  final FocusNode? focusNode;
  final bool autofocus;

  const MegaCheckBox({
    Key? key,
    required this.value,
    this.tristate = false,
    required this.onChanged,
    this.accentColor = MegaStyle.accentColor1,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  _MegaCheckBoxState createState() => _MegaCheckBoxState();
}

class _MegaCheckBoxState extends State<MegaCheckBox> {
  bool hovering = false;
  bool focused = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    bool disabled = widget.onChanged != null ? false : true;
    bool selected = widget.value != null ? widget.value! : true;

    void _handleValueChange() {
      if (!disabled) {
        switch (widget.value) {
          case false:
            widget.onChanged!(true);
            break;
          case true:
            widget.onChanged!(widget.tristate ? null : false);
            break;
          case null:
            widget.onChanged!(false);
            break;
        }
      }
    }

    return GestureDetector(
      onTap: widget.onChanged != null ? _handleValueChange : null,
      child: FocusableActionDetector(
        focusNode: disabled ? null : widget.focusNode,
        autofocus: disabled ? false : widget.autofocus,
        onShowHoverHighlight: (hover) => setState(() => hovering = hover),
        onShowFocusHighlight: (focus) => setState(() => focused = focus),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              height: MegaStyle.checkBoxSize,
              width: MegaStyle.checkBoxSize,
              duration: MegaStyle.basicDuration,
              curve: MegaStyle.basicCurve,
              decoration: BoxDecoration(
                borderRadius: MegaStyle.checkBoxBorderRadius,
                border: Border.all(
                  color: focused
                      ? widget.accentColor
                      : selected
                          ? widget.accentColor
                          : borderColor(context),
                ),
                color: disabled
                    ? backgroundColorDisabled(context)
                    : selected
                        ? widget.accentColor
                        : hovering
                            ? hoverColor(context)
                            : backgroundColor(context),
              ),
            ),
            AnimatedContainer(
              height: MegaStyle.checkBoxSize,
              width: MegaStyle.checkBoxSize,
              duration: MegaStyle.basicDuration,
              curve: MegaStyle.basicCurve,
              child: widget.value != null
                  ? Icon(
                      Icons.check_outlined,
                      size: selected ? MegaStyle.checkBoxIconSize : 0,
                      color: disabled
                          ? backgroundColorDisabled(context)
                          : selected
                              ? cardBackgroundColor(context)
                              : hovering
                                  ? hoverColor(context)
                                  : backgroundColor(context),
                    )
                  : Icon(
                      Icons.remove_outlined,
                      size: selected ? MegaStyle.checkBoxIconSize : 0,
                      color: disabled
                          ? backgroundColorDisabled(context)
                          : selected
                              ? cardBackgroundColor(context)
                              : hovering
                                  ? hoverColor(context)
                                  : backgroundColor(context),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
