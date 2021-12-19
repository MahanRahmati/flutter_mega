import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaBadge extends StatelessWidget {
  final Widget child;
  final Color accentColor;

  const MegaBadge({
    Key? key,
    required this.child,
    this.accentColor = MegaStyle.accentColor1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: AnimatedContainer(
        height: MegaStyle.badgeSize,
        duration: MegaStyle.basicDuration,
        curve: MegaStyle.basicCurve,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          color: accentColor,
        ),
        padding: MegaStyle.horizontal,
        child: child,
      ),
    );
  }
}
