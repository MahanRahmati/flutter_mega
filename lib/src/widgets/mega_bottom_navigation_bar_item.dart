import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaBottomNavigationBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget badge;
  final Color accentColor;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaBottomNavigationBarItem({
    Key? key,
    required this.icon,
    required this.title,
    this.badge = const SizedBox.shrink(),
    this.accentColor = MegaStyle.accentColor1,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MegaBaseButton(
            onTap: onPressed,
            height: MegaStyle.buttonSize,
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
                    color: iconColor(context),
                  ),
                ),
                Text(title, style: button(context, false)),
                const Spacer(),
                badge,
              ],
            ),
          ),
          AnimatedContainer(
            height: selected ? MegaStyle.iconSize : 0,
            width: MegaStyle.halfPadding,
            duration: MegaStyle.basicDuration,
            curve: MegaStyle.basicCurve,
            decoration: BoxDecoration(
              borderRadius: MegaStyle.borderRadius,
              color: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}