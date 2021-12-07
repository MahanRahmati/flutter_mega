import 'package:flutter/material.dart';
import 'package:mega/src/styles/mega_styles.dart';
import 'package:mega/src/utils/theme_picker.dart';
import 'package:mega/src/widgets/mega_bottom_navigation_bar_compact_item.dart';
import 'package:mega/src/widgets/mega_bottom_navigation_bar_item.dart';

class MegaBottomNavigationBar extends StatelessWidget {
  final List<MegaBottomNavigationItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool compact;

  const MegaBottomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    required this.onTap,
    this.compact = false,
  }) : super(key: key);

  List<Widget> tiles() {
    final List<Widget> tiles = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      if (compact || items.length > 3) {
        tiles.add(
          MegaBottomNavigationBarCompactItem(
            icon: items[i].icon,
            accentColor: items[i].accentColor,
            selected: i == currentIndex,
            focusNode: items[i].focusNode,
            autofocus: items[i].autofocus,
            onTap: (i) => onTap(i),
            index: i,
          ),
        );
      } else {
        tiles.add(
          MegaBottomNavigationBarItem(
            icon: items[i].icon,
            title: items[i].title,
            accentColor: items[i].accentColor,
            selected: i == currentIndex,
            focusNode: items[i].focusNode,
            autofocus: items[i].autofocus,
            onTap: (i) => onTap(i),
            index: i,
          ),
        );
      }
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ThemePicker.of(context).pick(
                light: MegaStyle.borderColorLight,
                dark: MegaStyle.borderColorDark,
              ),
            ),
            bottom: BorderSide(
              color: ThemePicker.of(context).pick(
                light: MegaStyle.borderColorLight,
                dark: MegaStyle.borderColorDark,
              ),
            ),
          ),
          color: ThemePicker.of(context).pick(
            light: MegaStyle.headerColorLight,
            dark: MegaStyle.headerColorDark,
          ),
        ),
        height: MegaStyle.headerBarHeight,
        width: double.infinity,
        child: Padding(
          padding: MegaStyle.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tiles(),
          ),
        ),
      ),
    );
  }
}

class MegaBottomNavigationItem {
  final IconData icon;
  final String title;
  final Color accentColor;
  final FocusNode? focusNode;
  final bool autofocus;

  MegaBottomNavigationItem({
    required this.icon,
    required this.title,
    this.accentColor = MegaStyle.accentColor1,
    this.focusNode,
    this.autofocus = false,
  });
}
