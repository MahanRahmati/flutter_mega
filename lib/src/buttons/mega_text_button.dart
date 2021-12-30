import 'package:mega/mega.dart';

class MegaTextButton extends StatelessWidget {
  final String text;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaTextButton({
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
    return Padding(
      padding: MegaStyle.small,
      child: MegaBaseButton(
        onTap: onPressed,
        disabled: disabled,
        selected: selected,
        focusNode: focusNode,
        autofocus: autofocus,
        child: Align(
          alignment: Alignment.center,
          child: Text(text, style: button(context, disabled)),
        ),
      ),
    );
  }
}
