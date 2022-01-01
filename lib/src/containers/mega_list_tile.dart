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
            borderRadius: MegaStyle.borderRadius,
            border: Border.all(
              color: disabled
                  ? MegaStyle.transparent
                  : focused
                      ? widget.accentColor
                      : borderColor(context),
            ),
            color: disabled
                ? MegaStyle.transparent
                : hovering
                    ? hoverColor(context)
                    : backgroundColor(context),
          ),
          padding: MegaStyle.normal,
          child: Row(
            children: [
              Padding(padding: MegaStyle.horizontal, child: widget.leading),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null)
                    Padding(
                      padding: MegaStyle.horizontal,
                      child: Text(widget.title!, style: bodyText1(context)),
                    ),
                  if (widget.subtitle != null)
                    Padding(
                      padding: MegaStyle.horizontal,
                      child: Text(widget.subtitle!, style: subtitle2(context)),
                    ),
                ],
              ),
              const Spacer(),
              Padding(padding: MegaStyle.horizontal, child: widget.trailing),
            ],
          ),
        ),
      ),
    );
  }
}
