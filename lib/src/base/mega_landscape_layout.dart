import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mega/mega.dart';

class MegaLandscapeLayout extends StatefulWidget {
  final Widget headerBarLeading;
  final Widget headerBarCenter;
  final Widget headerBarTrailing;
  final int selectedIndex;
  final List<NavigationItem> items;
  final ValueChanged<int> onItemSelected;

  const MegaLandscapeLayout({
    Key? key,
    required this.headerBarLeading,
    required this.headerBarCenter,
    required this.headerBarTrailing,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  _MegaLandscapeLayoutState createState() => _MegaLandscapeLayoutState();
}

class _MegaLandscapeLayoutState extends State<MegaLandscapeLayout> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void onTap(int index) {
    widget.onItemSelected(index);
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor(context)),
      child: Column(
        children: [
          MegaHeaderBar(
            leading: widget.headerBarLeading,
            center: widget.headerBarCenter,
            trailing: widget.headerBarTrailing,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  width: deviceWidth(context) > 960.0
                      ? MegaStyle.sideBarWidth
                      : MegaStyle.sideBarCompactWidth,
                  duration: MegaStyle.basicDuration,
                  curve: MegaStyle.basicCurve,
                  decoration: BoxDecoration(color: sideColor(context)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: widget.items.map((item) {
                        var index = widget.items.indexOf(item);
                        return MegaSideBarItem(
                          icon: item.icon,
                          title: item.title,
                          badge: item.badge,
                          selected: index == _selectedIndex,
                          onPressed: () => onTap(index),
                          compact: deviceWidth(context) < 960.0,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const MegaVerticalDivider(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: MegaStyle.normal,
                        child: widget.items[_selectedIndex].builder(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
