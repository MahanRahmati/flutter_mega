import 'package:mega/mega.dart';

class MegaCheckBoxListTile extends StatefulWidget {
  final bool? value;
  final bool tristate;
  final ValueChanged<bool?>? onChanged;
  final Color accentColor;
  final String? title;
  final String? subtitle;
  final FocusNode? focusNode;
  final bool autofocus;

  const MegaCheckBoxListTile({
    Key? key,
    required this.value,
    this.tristate = false,
    required this.onChanged,
    this.accentColor = MegaStyle.accentColor1,
    this.title,
    this.subtitle,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  @override
  State<MegaCheckBoxListTile> createState() => _MegaCheckBoxListTileState();
}

class _MegaCheckBoxListTileState extends State<MegaCheckBoxListTile> {
  bool hovering = false;
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    bool disabled = widget.onChanged != null ? false : true;

    void _handleValueChange() {
      if (!disabled) {
        switch (widget.value) {
          case false:
            widget.onChanged!(true);
            break;
          case true:
            widget.onChanged!(widget.tristate ? null : false);
            break;
          case null:
            widget.onChanged!(false);
            break;
        }
      }
    }

    return GestureDetector(
      onTap: widget.onChanged != null ? _handleValueChange : null,
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
                child: MegaCheckBox(
                  value: widget.value,
                  tristate: widget.tristate,
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
