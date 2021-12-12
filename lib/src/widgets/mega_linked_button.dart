import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaLinkedButton extends StatelessWidget {
  final String text;
  final IconData icon;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool disabled = onPressed != null ? false : true;
    return MegaBaseButton(
      onTap: onPressed,
      height: MegaStyle.buttonSize,
      borderRadius: const BorderRadius.all(Radius.circular(0)),
      disabled: disabled,
      selected: selected,
      focusNode: focusNode,
      autofocus: autofocus,
      child: Row(
        children: [
          Padding(
            padding: MegaStyle.right,
            child: Icon(
              icon,
              size: MegaStyle.iconSize,
              color: disabled ? disabledColor(context) : iconColor(context),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(text, style: button(context, disabled)),
          ),
        ],
      ),
    );
  }
}
