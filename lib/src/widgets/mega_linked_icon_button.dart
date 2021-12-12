import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaLinkedIconButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaLinkedIconButton({
    Key? key,
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
      width: MegaStyle.buttonSize,
      disabled: disabled,
      selected: selected,
      focusNode: focusNode,
      autofocus: autofocus,
      child: Icon(
        icon,
        size: MegaStyle.iconSize,
        color: disabled ? disabledColor(context) : iconColor(context),
      ),
    );
  }
}
