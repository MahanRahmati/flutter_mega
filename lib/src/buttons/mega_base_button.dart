import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaBaseButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double? width;
  final bool disabled;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget child;

  const MegaBaseButton({
    Key? key,
    this.onTap,
    this.width,
    this.disabled = true,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.child,
  }) : super(key: key);

  @override
  State<MegaBaseButton> createState() => _MegaBaseButtonState();
}

class _MegaBaseButtonState extends State<MegaBaseButton> {
  bool hovering = false;
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: FocusableActionDetector(
        focusNode: widget.disabled ? null : widget.focusNode,
        autofocus: widget.disabled ? false : widget.autofocus,
        onShowHoverHighlight: (hover) => setState(() => hovering = hover),
        onShowFocusHighlight: (focus) => setState(() => focused = focus),
        child: AnimatedContainer(
          height: MegaStyle.buttonSize,
          width: widget.width,
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(
            borderRadius: MegaStyle.borderRadius,
            border: Border.all(
              color: focused
                  ? MegaStyle.accentColor1
                  : widget.selected
                      ? MegaStyle.accentColor1
                      : borderColor(context),
            ),
            color: widget.disabled
                ? backgroundColorDisabled(context)
                : hovering
                    ? hoverColor(context)
                    : backgroundColor(context),
          ),
          padding: MegaStyle.horizontal,
          child: widget.child,
        ),
      ),
    );
  }
}
