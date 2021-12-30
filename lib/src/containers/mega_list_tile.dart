import 'package:mega/mega.dart';

class MegaListTile extends StatelessWidget {
  final Widget leading;
  final String? title;
  final String? subtitle;
  final Widget trailing;

  const MegaListTile({
    Key? key,
    this.leading = const SizedBox.shrink(),
    this.title,
    this.subtitle,
    this.trailing = const SizedBox.shrink(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MegaStyle.small,
      child: Row(
        children: [
          Padding(
            padding: MegaStyle.horizontal,
            child: leading,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Padding(
                  padding: MegaStyle.horizontal,
                  child: Text(
                    title!,
                    style: bodyText1(context),
                  ),
                ),
              if (subtitle != null)
                Padding(
                  padding: MegaStyle.horizontal,
                  child: Text(
                    subtitle!,
                    style: subtitle2(context),
                  ),
                ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: MegaStyle.horizontal,
            child: trailing,
          ),
        ],
      ),
    );
  }
}
