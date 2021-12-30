import 'package:mega/mega.dart';

class MegaHeaderBar extends StatelessWidget {
  final Widget leading;
  final Widget center;
  final Widget trailing;

  const MegaHeaderBar({
    Key? key,
    this.leading = const SizedBox.shrink(),
    this.center = const SizedBox.shrink(),
    this.trailing = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(color: headerColor(context)),
          ),
          Container(
            height: MegaStyle.headerBarHeight,
            width: double.infinity,
            decoration: BoxDecoration(color: headerColor(context)),
            child: Padding(
              padding: MegaStyle.horizontal,
              child: Row(
                children: [
                  leading,
                  const Spacer(),
                  center,
                  const Spacer(),
                  trailing,
                ],
              ),
            ),
          ),
          const MegaHorizontalDivider(),
        ],
      ),
    );
  }
}
