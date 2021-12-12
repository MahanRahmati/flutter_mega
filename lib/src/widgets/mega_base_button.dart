import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaBaseButton extends StatefulWidget {
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;
  final BoxBorder? border;
  final bool disabled;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final Widget child;

  const MegaBaseButton({
    Key? key,
    this.onTap,
    this.height,
    this.width,
    this.borderRadius = MegaStyle.borderRadius,
    this.border,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: FocusableActionDetector(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        onShowHoverHighlight: (hover) => setState(() => hovering = hover),
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            border: widget.border,
            color: widget.disabled
                ? backgroundColorDisabled(context)
                : widget.selected
                    ? hoverColor(context)
                    : hovering
                        ? hoverColor(context)
                        : backgroundColor(context),
          ),
          padding: MegaStyle.horizontal,
          child: Row(mainAxisSize: MainAxisSize.min, children: [widget.child]),
        ),
      ),
    );
  }
}
