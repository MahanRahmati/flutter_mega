import 'package:mega/mega.dart';

class MegaList extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MegaList({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> newChildren = [];
    if (children.isNotEmpty) {
      for (int i = 0; i < children.length; i++) {
        newChildren.add(children[i]);
        if (children.length - i != 1) {
          newChildren.add(const MegaHorizontalDivider());
        }
      }
    }

    return Padding(
      padding: MegaStyle.normal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              MegaStyle.padding,
              0,
              MegaStyle.padding,
              MegaStyle.largePadding,
            ),
            child: Text(
              title,
              style: headline6(context),
              textAlign: TextAlign.left,
            ),
          ),
          AnimatedContainer(
            duration: MegaStyle.basicDuration,
            curve: MegaStyle.basicCurve,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: MegaStyle.borderRadius,
              border: Border.all(color: borderColor(context)),
              color: cardBackgroundColor(context),
            ),
            child: ClipRRect(
              borderRadius: MegaStyle.borderRadius,
              child: Column(children: newChildren),
            ),
          ),
        ],
      ),
    );
  }
}
