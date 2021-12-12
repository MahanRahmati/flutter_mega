import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaStatusBar extends StatelessWidget {
  final Widget child;

  const MegaStatusBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Container(
        height: MegaStyle.buttonSize,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          border: Border.all(color: borderColor(context)),
          color: backgroundColor(context),
        ),
        child: child,
      ),
    );
  }
}
