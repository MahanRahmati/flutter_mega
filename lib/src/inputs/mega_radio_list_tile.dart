import 'package:mega/mega.dart';

class MegaRadioListTile<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color accentColor;
  final String? title;
  final String? subtitle;
  final FocusNode? focusNode;
  final bool autofocus;

  const MegaRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.accentColor = MegaStyle.accentColor1,
    this.title,
    this.subtitle,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  State<MegaRadioListTile> createState() => _MegaRadioListTileState();
}

class _MegaRadioListTileState extends State<MegaRadioListTile> {
  bool hovering = false;
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    bool disabled = widget.onChanged != null ? false : true;
    return GestureDetector(
      onTap: () {
        if (!disabled) widget.onChanged!(widget.value);
      },
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
              Padding(
                padding: MegaStyle.normal,
                child: MegaRadio(
                  value: widget.value,
                  groupValue: widget.groupValue,
                  onChanged: widget.onChanged,
                  accentColor: widget.accentColor,
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
