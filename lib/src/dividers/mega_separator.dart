import 'package:mega/mega.dart';

class MegaHorizontalSeparator extends StatelessWidget {
  const MegaHorizontalSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: MegaStyle.smallVertical,
      child: MegaHorizontalDivider(),
    );
  }
}

class MegaVerticalSeparator extends StatelessWidget {
  const MegaVerticalSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: MegaStyle.smallHorizontal,
      child: MegaVerticalDivider(),
    );
  }
}
