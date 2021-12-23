import 'package:flutter/material.dart' show Icons;
import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaCheckBox extends StatefulWidget {
  final bool value;
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
    return GestureDetector(
      onTap: () {
        if (!disabled) widget.onChanged!(widget.value);
      },
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
                      ? MegaStyle.accentColor1
                      : widget.value
                          ? MegaStyle.accentColor1
                          : borderColor(context),
                ),
                color: disabled
                    ? backgroundColorDisabled(context)
                    : widget.value
                        ? MegaStyle.accentColor1
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
              child: Icon(
                Icons.check_outlined,
                size: widget.value ? MegaStyle.checkBoxIconSize : 0,
                color: disabled
                    ? backgroundColorDisabled(context)
                    : widget.value
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