import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaSideBarCompactItem extends StatelessWidget {
  final IconData icon;
  final Widget badge;
  final Color accentColor;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;

  const MegaSideBarCompactItem({
    Key? key,
    required this.icon,
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
        alignment: Alignment.topRight,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              MegaBaseButton(
                onTap: onPressed,
                height: MegaStyle.buttonSize,
                width: MegaStyle.buttonSize,
                selected: selected,
                focusNode: focusNode,
                autofocus: autofocus,
                child: Icon(
                  icon,
                  size: MegaStyle.iconSize,
                  color: iconColor(context),
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
          badge,
        ],
      ),
    );
  }
}
