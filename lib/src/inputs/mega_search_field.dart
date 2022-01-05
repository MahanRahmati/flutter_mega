import 'package:mega/mega.dart';

class MegaSearchField extends StatelessWidget {
  final bool showSearch;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final String? hint;

  const MegaSearchField({
    Key? key,
    required this.showSearch,
    required this.controller,
    this.focusNode,
    this.autofocus = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          height: showSearch ? MegaStyle.headerBarHeight : 0,
          width: double.infinity,
          duration: MegaStyle.basicDuration,
          curve: MegaStyle.basicCurve,
          decoration: BoxDecoration(color: headerColor(context)),
          child: Padding(
            padding: MegaStyle.horizontal,
            child: Center(
              child: SizedBox(
                width: MegaStyle.searchWidth,
                child: MegaTextField(
                  controller: controller,
                  hint: hint,
                  onChanged: onChanged,
                  onEditingComplete: onEditingComplete,
                  onSubmitted: onSubmitted,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  focusNode: focusNode,
                  autofocus: autofocus,
                ),
              ),
            ),
          ),
        ),
        if (showSearch) const MegaHorizontalDivider(),
      ],
    );
  }
}
