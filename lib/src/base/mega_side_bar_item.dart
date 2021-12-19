import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaSideBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget badge;
  final Color accentColor;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onPressed;
  final bool compact;

  const MegaSideBarItem({
    Key? key,
    required this.icon,
    required this.title,
    this.badge = const SizedBox.shrink(),
    this.accentColor = MegaStyle.accentColor1,
    this.selected = false,
    this.focusNode,
    this.autofocus = false,
    required this.onPressed,
    this.compact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              MegaBaseButton(
                onTap: onPressed,
                width:
                    compact ? MegaStyle.buttonSize : MegaStyle.sideBarItemWidth,
                disabled: false,
                selected: selected,
                focusNode: focusNode,
                autofocus: autofocus,
                child: compact
                    ? Icon(
                        icon,
                        size: MegaStyle.iconSize,
                        color: iconColor(context),
                      )
                    : Row(
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
          badge,
        ],
      ),
    );
  }
}
