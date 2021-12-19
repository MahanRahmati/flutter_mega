import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaIconButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaIconButton({
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
    return Padding(
      padding: MegaStyle.small,
      child: MegaBaseButton(
        onTap: onPressed,
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
      ),
    );
  }
}
