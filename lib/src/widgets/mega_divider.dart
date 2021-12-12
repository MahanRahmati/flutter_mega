import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaHorizontalDivider extends StatelessWidget {
  const MegaHorizontalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.0,
      decoration: BoxDecoration(color: borderColor(context)),
    );
  }
}

class MegaVerticalDivider extends StatelessWidget {
  const MegaVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      decoration: BoxDecoration(color: borderColor(context)),
    );
  }
}
