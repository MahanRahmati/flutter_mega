import 'package:mega/mega.dart';

class MegaLinkedButtons extends StatelessWidget {
  final List<MegaLinkedButton> buttons;

  const MegaLinkedButtons({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: buttons.map((button) {
          bool first = false;
          bool last = false;
          var index = buttons.indexOf(button);
          if (index == 0) first = true;
          if (index == buttons.length - 1) last = true;
          return _MegaLinked(
            button: button,
            first: first,
            last: last,
            disabled: button.onPressed != null ? false : true,
          );
        }).toList(),
      ),
    );
  }
}

class _MegaLinked extends StatefulWidget {
  final MegaLinkedButton button;
  final bool first;
  final bool last;
  final bool disabled;

  const _MegaLinked({
    Key? key,
    required this.button,
    required this.first,
    required this.last,
    this.disabled = true,
  }) : super(key: key);

  @override
  _MegaLinkedState createState() => _MegaLinkedState();
}

class _MegaLinkedState extends State<_MegaLinked> {
  bool hovering = false;
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    Widget buttons() {
      if (widget.button.icon == null) {
        return Align(
          alignment: Alignment.center,
          child: Text(widget.button.text!,
              style: button(context, widget.disabled)),
        );
      }
      if (widget.button.text == null) {
        return Icon(
          widget.button.icon,
          size: MegaStyle.iconSize,
          color: widget.disabled ? disabledColor(context) : iconColor(context),
        );
      }
      return Row(
        children: [
          Padding(
            padding: MegaStyle.right,
            child: Icon(
              widget.button.icon,
              size: MegaStyle.iconSize,
              color:
                  widget.disabled ? disabledColor(context) : iconColor(context),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.button.text!,
              style: button(context, widget.disabled),
            ),
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: widget.button.onPressed,
      child: FocusableActionDetector(
        focusNode: widget.disabled ? null : widget.button.focusNode,
        autofocus: widget.disabled ? false : widget.button.autofocus,
        onShowHoverHighlight: (hover) => setState(() => hovering = hover),
        onShowFocusHighlight: (focus) => setState(() => focused = focus),
        child: AnimatedContainer(
          height: MegaStyle.buttonSize,
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: widget.first
                  ? const Radius.circular(MegaStyle.borderRadiusSize)
                  : const Radius.circular(0),
              bottomRight: widget.last
                  ? const Radius.circular(MegaStyle.borderRadiusSize)
                  : const Radius.circular(0),
              topLeft: widget.first
                  ? const Radius.circular(MegaStyle.borderRadiusSize)
                  : const Radius.circular(0),
              topRight: widget.last
                  ? const Radius.circular(MegaStyle.borderRadiusSize)
                  : const Radius.circular(0),
            ),
            border: Border.all(
              color: focused
                  ? MegaStyle.accentColor1
                  : widget.button.selected
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
          child: buttons(),
        ),
      ),
    );
  }
}

class MegaLinkedButton {
  final String? text;
  final IconData? icon;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaLinkedButton({
    Key? key,
    required this.text,
    required this.icon,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  });

  const MegaLinkedButton.icon({
    Key? key,
    this.text,
    required this.icon,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  });

  const MegaLinkedButton.text({
    Key? key,
    required this.text,
    this.icon,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  });
}
