import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaLinkedButtons extends StatelessWidget {
  final List<Widget> buttons;

  const MegaLinkedButtons({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> addDividers(List<Widget> buttons) {
      for (int i = 1; i < buttons.length; i = i + 2) {
        buttons.insert(i, const MegaVerticalDivider());
      }
      return buttons;
    }

    return Padding(
      padding: MegaStyle.small,
      child: Container(
        height: MegaStyle.buttonSize,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          border: Border.all(color: borderColor(context)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Row(children: addDividers(buttons)),
        ),
      ),
    );
  }
}
