import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaLinkedTextButton extends StatelessWidget {
  final String text;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaLinkedTextButton({
    Key? key,
    required this.text,
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
      child: Align(
        alignment: Alignment.center,
        child: Text(text, style: button(context, disabled)),
      ),
    );
  }
}
