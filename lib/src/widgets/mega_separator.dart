import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/widgets/mega_divider.dart';

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
