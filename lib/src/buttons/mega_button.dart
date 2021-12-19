import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaButton({
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
    return Padding(
      padding: MegaStyle.small,
      child: MegaBaseButton(
        onTap: onPressed,
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
      ),
    );
  }
}
