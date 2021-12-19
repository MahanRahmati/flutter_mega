import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaHorizontalSeparator extends StatelessWidget {
  const MegaHorizontalSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: MegaStyle.hVertical,
      child: MegaHorizontalDivider(),
    );
  }
}

class MegaVerticalSeparator extends StatelessWidget {
  const MegaVerticalSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: MegaStyle.hHorizontal,
      child: MegaVerticalDivider(),
    );
  }
}
