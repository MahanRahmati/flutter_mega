import 'package:mega/mega.dart';

class MegaRadio<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color accentColor;
  final FocusNode? focusNode;
  final bool autofocus;

  const MegaRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.accentColor = MegaStyle.accentColor1,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  bool get _selected => value == groupValue;

  @override
  State<MegaRadio<T>> createState() => _MegaRadioState<T>();
}

class _MegaRadioState<T> extends State<MegaRadio<T>> {
  bool hovering = false;
  bool focused = false;

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
              height: MegaStyle.radioSize,
              width: MegaStyle.radioSize,
              duration: MegaStyle.basicDuration,
              curve: MegaStyle.basicCurve,
              decoration: BoxDecoration(
                borderRadius: MegaStyle.radioBorderRadius,
                border: Border.all(
                  color: focused
                      ? widget.accentColor
                      : widget._selected
                          ? widget.accentColor
                          : borderColor(context),
                ),
                color: disabled
                    ? backgroundColorDisabled(context)
                    : widget._selected
                        ? widget.accentColor
                        : hovering
                            ? hoverColor(context)
                            : backgroundColor(context),
              ),
            ),
            AnimatedContainer(
              height: widget._selected ? MegaStyle.radioIndicatorSize : 0,
              width: widget._selected ? MegaStyle.radioIndicatorSize : 0,
              duration: MegaStyle.basicDuration,
              curve: MegaStyle.basicCurve,
              decoration: BoxDecoration(
                borderRadius: MegaStyle.radioBorderRadius,
                color: disabled
                    ? backgroundColorDisabled(context)
                    : widget._selected
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
