import 'package:flutter/widgets.dart';
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
    return Padding(
      padding: MegaStyle.normal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MegaStyle.normal,
            child: Text(
              title,
              style: headline6(context),
              textAlign: TextAlign.left,
            ),
          ),
          AnimatedContainer(
            padding: MegaStyle.normal,
            duration: MegaStyle.basicDuration,
            curve: MegaStyle.basicCurve,
            decoration: BoxDecoration(
              borderRadius: MegaStyle.borderRadius,
              border: Border.all(color: borderColor(context)),
              color: cardBackgroundColor(context),
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}
