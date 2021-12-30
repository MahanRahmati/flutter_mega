import 'package:mega/mega.dart';

class MegaStatusBar extends StatelessWidget {
  final String text;

  const MegaStatusBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Container(
        height: MegaStyle.buttonSize,
        decoration: BoxDecoration(
          borderRadius: MegaStyle.borderRadius,
          border: Border.all(color: reverseBorderColor(context)),
          color: reverseBackgroundColor(context),
        ),
        child: Padding(
          padding: MegaStyle.small,
          child: Text(text, style: statusBarText(context)),
        ),
      ),
    );
  }
}
