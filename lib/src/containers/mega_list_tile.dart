import 'package:mega/mega.dart';

class MegaListTile extends StatefulWidget {
  final Widget leading;
  final String? title;
  final String? subtitle;
  final Widget trailing;
  final VoidCallback? onPressed;
  final Color accentColor;
  final FocusNode? focusNode;
  final bool autofocus;

  const MegaListTile({
    Key? key,
    this.leading = const SizedBox.shrink(),
    this.title,
    this.subtitle,
    this.trailing = const SizedBox.shrink(),
    this.onPressed,
    this.accentColor = MegaStyle.accentColor1,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  State<MegaListTile> createState() => _MegaListTileState();
}

class _MegaListTileState extends State<MegaListTile> {
  bool hovering = false;
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    bool disabled = widget.onPressed != null ? false : true;
    return GestureDetector(
      onTap: widget.onPressed,
      child: FocusableActionDetector(
        focusNode: disabled ? null : widget.focusNode,
        autofocus: disabled ? false : widget.autofocus,
        onShowHoverHighlight: (hover) => setState(() => hovering = hover),
        onShowFocusHighlight: (focus) => setState(() => focused = focus),
        child: AnimatedContainer(
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(
            color: disabled
                ? cardBackgroundColor(context)
                : hovering
                    ? hoverColor(context)
                    : cardBackgroundColor(context),
          ),
          padding: const EdgeInsets.fromLTRB(
            MegaStyle.largePadding,
            MegaStyle.padding,
            MegaStyle.largePadding,
            MegaStyle.padding,
          ),
          child: Row(
            children: [
              Padding(padding: MegaStyle.normal, child: widget.leading),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        MegaStyle.padding,
                        MegaStyle.smallPadding,
                        MegaStyle.padding,
                        MegaStyle.smallPadding,
                      ),
                      child: Text(widget.title!, style: bodyText1(context)),
                    ),
                  if (widget.subtitle != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        MegaStyle.padding,
                        MegaStyle.smallPadding,
                        MegaStyle.padding,
                        MegaStyle.smallPadding,
                      ),
                      child: Text(widget.subtitle!, style: subtitle2(context)),
                    ),
                ],
              ),
              const Spacer(),
              Padding(padding: MegaStyle.normal, child: widget.trailing),
            ],
          ),
        ),
      ),
    );
  }
}
