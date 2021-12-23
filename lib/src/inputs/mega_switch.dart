import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color accentColor;
  final FocusNode? focusNode;
  final bool autofocus;

  const MegaSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.accentColor = MegaStyle.accentColor1,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  _MegaSwitchState createState() => _MegaSwitchState();
}

class _MegaSwitchState extends State<MegaSwitch> {
  bool hovering = false;
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    bool disabled = widget.onChanged != null ? false : true;
    return GestureDetector(
      onTap: () {
        if (!disabled) widget.onChanged!(!widget.value);
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
              height: MegaStyle.switchHeight,
              width: MegaStyle.switchWidth,
              duration: MegaStyle.basicDuration,
              curve: MegaStyle.basicCurve,
              decoration: BoxDecoration(
                borderRadius: MegaStyle.switchBorderRadius,
                border: Border.all(
                  color: focused
                      ? widget.accentColor
                      : widget.value
                          ? widget.accentColor
                          : borderColor(context),
                ),
                color: disabled
                    ? backgroundColorDisabled(context)
                    : widget.value
                        ? widget.accentColor
                        : hovering
                            ? hoverColor(context)
                            : backgroundColor(context),
              ),
            ),
            AnimatedPositioned(
              duration: MegaStyle.basicDuration,
              curve: MegaStyle.basicCurve,
              left: widget.value
                  ? MegaStyle.switchWidth - MegaStyle.switchThumbSize - 2
                  : 2,
              child: AnimatedContainer(
                height: MegaStyle.switchThumbSize,
                width: MegaStyle.switchThumbSize,
                duration: MegaStyle.basicDuration,
                curve: MegaStyle.basicCurve,
                decoration: BoxDecoration(
                  borderRadius: MegaStyle.radioBorderRadius,
                  border: Border.all(color: borderColor(context)),
                  color: disabled
                      ? backgroundColorDisabled(context)
                      : MegaStyle.cardBackgroundColorLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
