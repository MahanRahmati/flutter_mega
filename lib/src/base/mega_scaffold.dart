import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

// Based on https://github.com/ubuntu/yaru_widgets.dart/blob/main/lib/src/yaru_master_detail_page.dart
class MegaScaffold extends StatefulWidget {
  final Widget headerBarLeading;
  final Widget headerBarCenter;
  final Widget headerBarTrailing;
  final Widget body;
  final List<NavigationItem>? items;
  final ValueChanged<int>? onItemSelected;

  const MegaScaffold({
    Key? key,
    this.headerBarLeading = const SizedBox.shrink(),
    this.headerBarCenter = const SizedBox.shrink(),
    this.headerBarTrailing = const SizedBox.shrink(),
    required this.body,
    this.items,
    this.onItemSelected,
  }) : super(key: key);

  @override
  State<MegaScaffold> createState() => _MegaScaffoldState();
}

class _MegaScaffoldState extends State<MegaScaffold> {
  var _index = -1;
  var _previousIndex = 0;

  void _setIndex(int index) {
    _previousIndex = _index;
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    return widget.items != null
        ? LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 644) {
                return MegaPortraitLayout(
                  headerBarLeading: widget.headerBarLeading,
                  headerBarCenter: widget.headerBarCenter,
                  headerBarTrailing: widget.headerBarTrailing,
                  selectedIndex: _index,
                  items: widget.items!,
                  onItemSelected: _setIndex,
                );
              } else {
                return MegaLandscapeLayout(
                  headerBarLeading: widget.headerBarLeading,
                  headerBarCenter: widget.headerBarCenter,
                  headerBarTrailing: widget.headerBarTrailing,
                  selectedIndex: _index == -1 ? _previousIndex : _index,
                  items: widget.items!,
                  onItemSelected: _setIndex,
                );
              }
            },
          )
        : Container(
            decoration: BoxDecoration(color: backgroundColor(context)),
            child: Column(
              children: [
                MegaHeaderBar(
                  leading: widget.headerBarLeading,
                  center: widget.headerBarCenter,
                  trailing: widget.headerBarTrailing,
                ),
                Expanded(child: widget.body),
              ],
            ),
          );
  }
}

class NavigationItem {
  final String title;
  final IconData icon;
  final WidgetBuilder builder;
  final MegaBadge? badge;
  final Color accentColor;

  const NavigationItem({
    required this.title,
    required this.icon,
    required this.builder,
    this.badge,
    this.accentColor = MegaStyle.accentColor1,
  });
}
