import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;

  const MegaCard({
    Key? key,
    this.height,
    this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.normal,
      child: AnimatedContainer(
        height: height,
        width: width,
        padding: MegaStyle.normal,
        duration: MegaStyle.basicDuration,
        curve: MegaStyle.basicCurve,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          border: Border.all(color: borderColor(context)),
          color: cardBackgroundColor(context),
        ),
        child: child,
      ),
    );
  }
}
